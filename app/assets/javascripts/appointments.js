// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function updateFinishTime() {
	// update the finish hour select to match the start + 1 hour
	sH = document.getElementById('appointment_start_time_4i');
	fH = document.getElementById('appointment_finish_time_4i');
	fH.selectedIndex = sH.selectedIndex + 1;

	// update the finish minute select to match the start
	sM = document.getElementById('appointment_start_time_5i');
	fM = document.getElementById('appointment_finish_time_5i');
	fM.selectedIndex = sM.selectedIndex;
}


