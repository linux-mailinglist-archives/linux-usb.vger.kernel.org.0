Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C91B3618FE
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 06:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbhDPEsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 00:48:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54130 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhDPEse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 00:48:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618548490; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NiFvikKrJ/JxQsnjtoMJjqxxV+IgyY0W6ii9OWYNFSw=; b=Ysm4oGnK3roC4dkI00V86RsAQFGsyWLXohchRXP8j7j2NmJT6nEBvze4jdYxwhXoMFZvTaFE
 I2EFXgLsiLBtf8OJ7NsgO9NNWx/hkUsVVbyxrNWZtZEbNvxdlHChLxq5N6sgEOXSPkS2Z6+Y
 fsQJsYFBzFwGEAusUAlZq1y/bNg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60791702a817abd39a3a3adc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 04:48:02
 GMT
Sender: prathampratap=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 946BBC433CA; Fri, 16 Apr 2021 04:48:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (unknown [106.207.79.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: prathampratap)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28743C433CA;
        Fri, 16 Apr 2021 04:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28743C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=prathampratap@codeaurora.org
Subject: Re: USB port resume can take 60 seconds in worst case scenario
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
 <20210412200437.GA1428564@rowland.harvard.edu>
From:   Pratham Pratap <prathampratap@codeaurora.org>
Message-ID: <8b64db94-318e-06e5-85ed-8e7a0474aaf7@codeaurora.org>
Date:   Fri, 16 Apr 2021 10:17:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412200437.GA1428564@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Yes this is a real problem and not observed very often.

Thanks for the suggestions, I will give it a try to see if it helps. BTW 
below are the logs for the same.

<3>[  217.425866] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
xhci-plat resume
<3>[  217.425883] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
xhci-plat runtime resume
<6>[  217.425945] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
// Setting command ring address to 0xeffab001
<6>[  217.425991] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
xhci_resume: starting port polling.
<6>[  217.426007] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  217.426020] [2: kworker/u16:18:19265]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  217.426096] [0: kworker/u16:23:19270]  usb_resume_both : 
test_in_resume = 1
<6>[  217.426125] [3: kworker/u16:16:19263]  usb_resume_both : 
test_in_resume = 1
<3>[  217.426153] [0: kworker/u16:23:19270]  hub 1-0:1.0: hub_resume
<3>[  217.426170] [3: kworker/u16:16:19263]  hub 2-0:1.0: hub_resume
<6>[  217.426189] [0: kworker/u16:23:19270]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x663, return 0x107
<6>[  217.426204] [3: kworker/u16:16:19263]  xhci-hcd xhci-hcd.4.auto: 
Get port status 2-1 read: 0x2a0, return 0x2a0
<3>[  217.426276] [0: kworker/u16:23:19270]  usb usb1-port1: status 0107 
change 0000
<6>[  217.426311] [3: kworker/u16:16:19263]  usb_resume_both : 
test_in_resume = 0
<6>[  217.426321] [0: kworker/u16:23:19270]  usb_resume_both : 
test_in_resume = 0
<6>[  217.426426] [1: kworker/u16:17:19264]  usb_resume_both : 
test_in_resume = 1
<6>[  217.426453] [1: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x663, return 0x107
<6>[  217.426576] [3: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear USB_PORT_FEAT_SUSPEND
<6>[  217.426585] [3: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
PORTSC 0663
<6>[  217.426601] [3: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Set port 1-1 link state, portsc: 0x663, write 0x107e1
<6>[  217.429592] [0:   Binder:728_2:11912] pca9468_charger_resume: 
update_timer
<6>[  217.429650] [0:   Binder:728_2:11912] max77705:max77705_resume
<6>[  217.429664] [0:   Binder:728_2:11912]  pdic_max77705: 
max77705_muic_resume
<6>[  217.429759] [0:   Binder:728_2:11912]  [VIB] max77705_vib: 
max77705_vibrator_resume: set default pinctrl
<6>[  217.432060] [1: kworker/u16:12:19259]  pci-msm-rc 0000:00:00.0: 
Refused to change power state, currently in D3
<3>[  217.432198] [0:   Binder:728_2:11912]  [SDE] 
ss_is_sot_hs_from_drm_mode : invalid drm_mode name len (0)
<3>[  217.432208] [0:   Binder:728_2:11912]  [SDE] 
ss_is_phs_from_drm_mode : invalid drm_mode name len (0)
<6>[  217.435836] [0:   Binder:728_2:11912] fps_qbt2000_resume: ret = 0
<6>[  217.435894] [0:   Binder:728_2:11912]  [pn547] pn547_resume: 
sec_nfc: resume!
<6>[  217.448208] [3: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Set port 1-1 link state, portsc: 0x7e3, write 0x10601
<6>[  217.448258]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x400603
<6>[  217.448273]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<3>[  217.448321] [2: kworker/u16:17:19264]  usb 1-1: usb resume
<3>[  217.449147]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  217.449158]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  217.449266]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  217.449274]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  217.492146] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x603, return 0x40103
<6>[  217.508200] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 suspend/resume change, portsc: 0x603
<3>[  217.508269] [2: kworker/u16:17:19264]  usb 1-1: Waited 0ms for CONNECT
<3>[  217.508280] [2: kworker/u16:17:19264]  usb 1-1: finish resume
<6>[  217.508293] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=0 , test_in_resume == 1, parent =-227291136
<6>[  217.508304] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  217.508311] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  217.508341] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  217.508348] [2: kworker/u16:17:19264]  Call trace:
<6>[  217.508359] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  217.508373] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  217.508383] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  217.508396] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  217.508403] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  217.508409] [2: kworker/u16:17:19264] usb_get_status+0xa4/0x114
<6>[  217.508415] [2: kworker/u16:17:19264] usb_port_resume+0x524/0x654
<6>[  217.508424] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  217.508430] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  217.508435] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  217.508441] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  217.508452] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  217.508459] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  217.508469] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  217.508479] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  217.508486] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  217.508495] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  217.508506] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  217.647785]I[2:      swapper/2:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  218.438774] [0:    kworker/0:1:    7]  pdic_max77705: 
max77705_muic_print_reg_log USBC1:0x27, USBC2:0x05, BC:0x80, CC0:0x82, 
CC1:0x9, PD0:0x0, PD1:0xc7 attached_dev:3
<6>[  218.438785] [0:    kworker/0:1:    7]  pdic_max77705: 
max77705_muic_print_reg_log UIC_INT_M:0x4, CC_INT_M:0x20, PD_INT_M:0x0, 
VDM_INT_M:0xf0, PMIC_MASK:0xf2, WDT:0, POR:0
<6>[  218.848199] [2:    kworker/2:1:   64]  PM: Active wake lock:
<6>[  218.848218] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(1), active_time(1461), total_time(1461)
<6>[  218.848227] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(30), active_time(1464), total_time(1504)
<6>[  218.848232] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(51), active_time(1464), total_time(1646)
<6>[  218.848258] [2:    kworker/2:1:   64]  PM: a600000.ssusb: 
active_count(4), active_time(1424), total_time(71254)
<6>[  220.640568] [2:    kworker/2:2:  488] 
tsens[0:325][1:328][2:328][3:328][4:328][5:328][6:328][7:325][8:325][9:321][10:328][11:325][12:328][13:331][14:328][15:325][16:321][17:325][18:321][19:318][20:321][21:325][22:325][23:325][24:325][25:318][26:321][27:328][28:318]
<6>[  220.647048] [2:    kworker/2:1:   64]  thermal_sys: 
[71:295][72:370][76:293][77:289][79:324]
<0>[  222.432157]I[1:      swapper/1:    0]  usb 1-1: **** DPM device 
timeout ****
<6>[  222.432165]I[1:      swapper/1:    0]  Call trace:
<6>[  222.432179]I[1:      swapper/1:    0] __switch_to+0x2b0/0x2e0
<6>[  222.432190]I[1:      swapper/1:    0] __schedule+0x614/0x8c8
<6>[  222.432195]I[1:      swapper/1:    0] schedule+0x8c/0xc0
<6>[  222.432202]I[1:      swapper/1:    0] schedule_timeout+0x90/0x120
<6>[  222.432207]I[1:      swapper/1:    0] wait_for_common+0xd0/0x16c
<6>[  222.432214]I[1:      swapper/1:    0] 
wait_for_completion_timeout+0x14/0x20
<6>[  222.432223]I[1:      swapper/1:    0] usb_start_wait_urb+0xd4/0x150
<6>[  222.432229]I[1:      swapper/1:    0] usb_control_msg+0xe0/0x15c
<6>[  222.432236]I[1:      swapper/1:    0] usb_get_status+0xa4/0x114
<6>[  222.432242]I[1:      swapper/1:    0] usb_port_resume+0x524/0x654
<6>[  222.432251]I[1:      swapper/1:    0] generic_resume+0x24/0x58
<6>[  222.432257]I[1:      swapper/1:    0] usb_resume_both+0x104/0x1cc
<6>[  222.432262]I[1:      swapper/1:    0] usb_resume+0x2c/0x118
<6>[  222.432268]I[1:      swapper/1:    0] usb_dev_resume+0x14/0x20
<6>[  222.432276]I[1:      swapper/1:    0] device_resume+0x314/0x49c
<6>[  222.432282]I[1:      swapper/1:    0] async_resume+0x24/0xfc
<6>[  222.432290]I[1:      swapper/1:    0] async_run_entry_fn+0x60/0x17c
<6>[  222.432298]I[1:      swapper/1:    0] process_one_work+0x2d8/0x574
<6>[  222.432307]I[1:      swapper/1:    0] worker_thread+0x28c/0x518
<6>[  222.432313]I[1:      swapper/1:    0] kthread+0x16c/0x17c
<6>[  222.432322]I[1:      swapper/1:    0] ret_from_fork+0x10/0x18
<4>[  222.432330]I[1:      swapper/1:    0]  usb 1-1: **** DPM usb 
watchdog warning usb : 1-1
<3>[  222.688204] [2: kworker/u16:17:19264]  usb 1-1: retry with 
reset-resume
<6>[  222.688245] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<6>[  222.738574]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  222.738589]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<3>[  222.739557]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  222.739572]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  222.739686]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  222.739693]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  222.752140] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  222.752223] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  222.808195] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  222.808217] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  222.808227] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  222.810036]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  222.810292] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Successful reset device command.
<6>[  222.810606] [2: kworker/u16:17:19264]  usb 1-1: reset full-speed 
USB device number 2 using xhci-hcd
<6>[  222.810621] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Slot already in default state
<6>[  222.810632] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  222.810642] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  222.810648] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  222.810667] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  222.810674] [2: kworker/u16:17:19264]  Call trace:
<6>[  222.810684] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  222.810691] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  222.810699] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  222.810707] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  222.810714] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  222.810722] [2: kworker/u16:17:19264] hub_port_init+0x2f0/0xe80
<6>[  222.810729] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  222.810735] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  222.810744] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  222.810750] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  222.810757] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  222.810763] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  222.810771] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  222.810777] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  222.810784] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  222.810791] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  222.810797] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  222.810804] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  222.810811] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<3>[  222.811016]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  222.811028]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  222.811165]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  222.811172]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  222.856156]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  223.328254] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  223.328266] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  223.328272] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  223.328284] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  223.328291] [2: kworker/u16:17:19264]  Call trace:
<6>[  223.328298] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  223.328305] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  223.328313] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  223.328323] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  223.328329] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  223.328334] [2: kworker/u16:17:19264] hub_port_init+0x384/0xe80
<6>[  223.328341] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  223.328346] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  223.328355] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  223.328362] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  223.328368] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  223.328374] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  223.328382] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  223.328388] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  223.328395] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  223.328402] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  223.328410] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  223.328418] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  223.328424] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  223.840308] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  223.840318] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  223.840323] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  223.840336] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  223.840343] [2: kworker/u16:17:19264]  Call trace:
<6>[  223.840349] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  223.840358] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  223.840365] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  223.840373] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  223.840379] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  223.840385] [2: kworker/u16:17:19264] hub_port_init+0x4b8/0xe80
<6>[  223.840392] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  223.840397] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  223.840406] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  223.840412] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  223.840418] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  223.840424] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  223.840431] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  223.840437] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  223.840444] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  223.840451] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  223.840458] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  223.840464] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  223.840470] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  223.968186] [2:    kworker/2:1:   64]  PM: Active wake lock:
<6>[  223.968201] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(1), active_time(6581), total_time(6581)
<6>[  223.968209] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(30), active_time(6584), total_time(6624)
<6>[  223.968216] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(51), active_time(6584), total_time(6766)
<6>[  223.968235] [2:    kworker/2:1:   64]  PM: a600000.ssusb: 
active_count(4), active_time(6544), total_time(76374)
<6>[  224.352248] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<6>[  224.402575]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  224.402587]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<3>[  224.403551]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  224.403566]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  224.403681]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  224.403689]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  224.416141] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  224.416222] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  224.472220] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  224.472233] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  224.472240] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  224.472475]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  224.472738] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  224.472750] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<3>[  224.472762] [2: kworker/u16:17:19264]  usb 1-1: device descriptor 
read/64, error -71
<6>[  224.473002] [2: kworker/u16:17:19264] send_usb_host_certi_uevent: 
WARNING=no_response
<3>[  224.473266]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  224.473278]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  224.473390]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  224.473398]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  224.576257] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Slot already in default state
<6>[  224.576272] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  224.576279] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  224.576284] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  224.576295] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  224.576301] [2: kworker/u16:17:19264]  Call trace:
<6>[  224.576308] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  224.576315] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  224.576322] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  224.576329] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  224.576335] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  224.576340] [2: kworker/u16:17:19264] hub_port_init+0x2f0/0xe80
<6>[  224.576346] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  224.576352] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  224.576360] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  224.576365] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  224.576370] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  224.576377] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  224.576383] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  224.576389] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  224.576396] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  224.576402] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  224.576409] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  224.576416] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  224.576422] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  224.592128]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  225.088192] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  225.088202] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  225.088208] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  225.088220] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  225.088226] [2: kworker/u16:17:19264]  Call trace:
<6>[  225.088233] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  225.088242] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  225.088249] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  225.088257] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  225.088264] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  225.088270] [2: kworker/u16:17:19264] hub_port_init+0x384/0xe80
<6>[  225.088275] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  225.088281] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  225.088288] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  225.088294] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  225.088299] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  225.088305] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  225.088311] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  225.088319] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  225.088325] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  225.088332] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  225.088339] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  225.088346] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  225.088352] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  225.600236] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  225.600248] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  225.600253] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  225.600265] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  225.600271] [2: kworker/u16:17:19264]  Call trace:
<6>[  225.600277] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  225.600285] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  225.600293] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  225.600300] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  225.600306] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  225.600312] [2: kworker/u16:17:19264] hub_port_init+0x4b8/0xe80
<6>[  225.600318] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  225.600323] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  225.600331] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  225.600338] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  225.600343] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  225.600349] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  225.600355] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  225.600362] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  225.600368] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  225.600374] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  225.600381] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  225.600387] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  225.600393] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  225.760483] [2:    kworker/2:2:  488] 
tsens[0:328][1:328][2:335][3:331][4:331][5:328][6:328][7:328][8:325][9:328][10:328][11:328][12:331][13:338][14:325][15:328][16:328][17:328][18:328][19:321][20:325][21:328][22:328][23:328][24:325][25:318][26:325][27:331][28:321]
<6>[  225.765653] [2:    kworker/2:1:   64]  thermal_sys: 
[71:296][72:370][76:294][77:292][79:325]
<6>[  226.112272] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<6>[  226.162595]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  226.162608]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<3>[  226.163551]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  226.163566]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  226.163696]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  226.163705]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  226.176141] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  226.176205] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  226.232192] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  226.232205] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  226.232212] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  226.232441]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  226.232696] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  226.232708] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<3>[  226.232718] [2: kworker/u16:17:19264]  usb 1-1: device descriptor 
read/64, error -71
<6>[  226.232792] [2: kworker/u16:17:19264] send_usb_host_certi_uevent: 
WARNING=no_response
<3>[  226.233140]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  226.233152]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  226.233284]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  226.233290]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  226.328155]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  226.336143] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
disable port 1-1, portsc: 0x6e1
<6>[  226.336212] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<6>[  226.386538]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  226.386551]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<3>[  226.387142]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  226.387153]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  226.387260]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  226.387269]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  226.400197] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  226.400257] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  226.456192] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  226.456205] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  226.456213] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  226.456448]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  226.456509] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  226.456517] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<6>[  226.456528] [2: kworker/u16:17:19264]  usb 1-1: reset full-speed 
USB device number 2 using xhci-hcd
<6>[  226.456536] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Slot already in default state
<6>[  226.456545] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  226.456552] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  226.456558] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  226.456570] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  226.456576] [2: kworker/u16:17:19264]  Call trace:
<6>[  226.456583] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  226.456591] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  226.456599] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  226.456607] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  226.456613] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  226.456620] [2: kworker/u16:17:19264] hub_port_init+0x2f0/0xe80
<6>[  226.456626] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  226.456631] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  226.456639] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  226.456644] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  226.456650] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  226.456656] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  226.456663] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  226.456670] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  226.456677] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  226.456684] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  226.456691] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  226.456698] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  226.456704] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<3>[  226.457319]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  226.457332]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  226.457458]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  226.457466]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  226.576156]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  226.977517] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  226.977539] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  226.977546] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  226.977575] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  226.977583] [2: kworker/u16:17:19264]  Call trace:
<6>[  226.977595] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  226.977607] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  226.977620] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  226.977634] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  226.977640] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  226.977647] [2: kworker/u16:17:19264] hub_port_init+0x384/0xe80
<6>[  226.977653] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  226.977659] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  226.977668] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  226.977674] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  226.977679] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  226.977685] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  226.977696] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  226.977702] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  226.977710] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  226.977720] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  226.977726] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  226.977733] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  226.977742] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  227.489431] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  227.489454] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  227.489460] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  227.489491] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  227.489499] [2: kworker/u16:17:19264]  Call trace:
<6>[  227.489510] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  227.489523] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  227.489533] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  227.489549] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  227.489555] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  227.489561] [2: kworker/u16:17:19264] hub_port_init+0x4b8/0xe80
<6>[  227.489568] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  227.489574] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  227.489582] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  227.489588] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  227.489594] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  227.489600] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  227.489610] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  227.489616] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  227.489625] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  227.489634] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  227.489640] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  227.489648] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  227.489657] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  228.001545] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<3>[  228.052844]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  228.052871]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  228.052997]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  228.053005]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  228.053089]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  228.053103]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<6>[  228.065342] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  228.065472] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  228.065506] [2:  kworker/u16:7:  386] fps_qbt2000_work_func_debug: 
ldo:1,ipc:1,wuhb:0,tz:1,type:qbt2000,int:1,0
<6>[  228.121404] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  228.121444] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  228.121454] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  228.121745]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  228.122055] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  228.122065] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<3>[  228.122088] [2: kworker/u16:17:19264]  usb 1-1: device descriptor 
read/64, error -71
<6>[  228.122270] [2: kworker/u16:17:19264] send_usb_host_certi_uevent: 
WARNING=no_response
<6>[  228.225395] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Slot already in default state
<6>[  228.225432] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  228.225443] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  228.225450] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  228.225479] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  228.225487] [2: kworker/u16:17:19264]  Call trace:
<6>[  228.225499] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  228.225512] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  228.225522] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  228.225534] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  228.225540] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  228.225547] [2: kworker/u16:17:19264] hub_port_init+0x2f0/0xe80
<6>[  228.225553] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  228.225559] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  228.225568] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  228.225574] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  228.225579] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  228.225586] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  228.225596] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  228.225602] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  228.225610] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  228.225620] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  228.225627] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  228.225635] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  228.225645] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  228.313293]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
xhci_hub_status_data: stopping port polling.
<6>[  228.737417] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  228.737440] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  228.737446] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  228.737477] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  228.737484] [2: kworker/u16:17:19264]  Call trace:
<6>[  228.737496] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  228.737508] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  228.737518] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  228.737529] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  228.737535] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  228.737542] [2: kworker/u16:17:19264] hub_port_init+0x384/0xe80
<6>[  228.737548] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  228.737555] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  228.737564] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  228.737571] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  228.737576] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  228.737582] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  228.737592] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  228.737599] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  228.737607] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  228.737616] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  228.737623] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  228.737631] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  228.737641] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  229.089394] [2:    kworker/2:1:   64]  PM: Active wake lock:
<6>[  229.089430] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(1), active_time(11702), total_time(11702)
<6>[  229.089438] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(30), active_time(11705), total_time(11745)
<6>[  229.089445] [2:    kworker/2:1:   64]  PM: [timerfd]: 
active_count(51), active_time(11705), total_time(11887)
<6>[  229.089489] [2:    kworker/2:1:   64]  PM: a600000.ssusb: 
active_count(4), active_time(11665), total_time(81495)
<6>[  229.249559] [2: kworker/u16:17:19264] usb_start_wait_urb: 
reset_resume=1 , test_in_resume == 1, parent =-227291136
<6>[  229.249583] [2: kworker/u16:17:19264]  CPU: 2 PID: 19264 Comm: 
kworker/u16:17 Tainted: G S         O 
5.4.61-qgki-21278872-userdebug-abO1QSQW_TEST #1
<6>[  229.249589] [2: kworker/u16:17:19264]  Hardware name: Samsung O1Q 
USA PROJECT - REV0.5 (board-id,12) (DT)
<6>[  229.249623] [2: kworker/u16:17:19264]  Workqueue: events_unbound 
async_run_entry_fn
<6>[  229.249633] [2: kworker/u16:17:19264]  Call trace:
<6>[  229.249646] [2: kworker/u16:17:19264] dump_backtrace.cfi_jt+0x0/0x4
<6>[  229.249660] [2: kworker/u16:17:19264] show_stack+0x18/0x24
<6>[  229.249673] [2: kworker/u16:17:19264] dump_stack+0xb8/0x114
<6>[  229.249686] [2: kworker/u16:17:19264] usb_start_wait_urb+0xc4/0x150
<6>[  229.249692] [2: kworker/u16:17:19264] usb_control_msg+0xe0/0x15c
<6>[  229.249701] [2: kworker/u16:17:19264] hub_port_init+0x4b8/0xe80
<6>[  229.249708] [2: kworker/u16:17:19264] 
usb_reset_and_verify_device+0x114/0x614
<6>[  229.249715] [2: kworker/u16:17:19264] usb_port_resume+0x384/0x654
<6>[  229.249725] [2: kworker/u16:17:19264] generic_resume+0x24/0x58
<6>[  229.249732] [2: kworker/u16:17:19264] usb_resume_both+0x104/0x1cc
<6>[  229.249737] [2: kworker/u16:17:19264] usb_resume+0x2c/0x118
<6>[  229.249744] [2: kworker/u16:17:19264] usb_dev_resume+0x14/0x20
<6>[  229.249758] [2: kworker/u16:17:19264] device_resume+0x314/0x49c
<6>[  229.249766] [2: kworker/u16:17:19264] async_resume+0x24/0xfc
<6>[  229.249776] [2: kworker/u16:17:19264] async_run_entry_fn+0x60/0x17c
<6>[  229.249787] [2: kworker/u16:17:19264] process_one_work+0x2d8/0x574
<6>[  229.249795] [2: kworker/u16:17:19264] worker_thread+0x28c/0x518
<6>[  229.249803] [2: kworker/u16:17:19264] kthread+0x16c/0x17c
<6>[  229.249815] [2: kworker/u16:17:19264] ret_from_fork+0x10/0x18
<6>[  229.761558] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<3>[  229.812859]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  229.812885]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  229.813011]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  229.813020]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  229.813103]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  229.813117]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<6>[  229.825574] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  229.825677] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  229.881517] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  229.881560] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  229.881569] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  229.881884]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  229.881961] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  229.881969] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<3>[  229.881987] [2: kworker/u16:17:19264]  usb 1-1: device descriptor 
read/64, error -71
<6>[  229.882150] [2: kworker/u16:17:19264] send_usb_host_certi_uevent: 
WARNING=no_response
<3>[  229.882726]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  229.882741]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  229.882874]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  229.882883]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  229.985591] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
disable port 1-1, portsc: 0x6e1
<6>[  229.985704] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
set port reset, actual port 0 status  = 0x6f1
<3>[  230.037025]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
msm_dwc3_pwr_irq received
<3>[  230.037052]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler irq_stat=3C102C
<3>[  230.037157]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler link state = 0x0005
<3>[  230.037165]I[0:      swapper/0:    0]  msm-dwc3 a600000.ssusb: 
dwc3_pwr_event_handler: unexpected PWR_EVNT, irq_stat=3C1020
<6>[  230.037240]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Port change event, 1-1, id 1, portsc: 0x200603
<6>[  230.037253]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
handle_port_status: starting port polling.
<6>[  230.049459] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Get port status 1-1 read: 0x200603, return 0x100103
<6>[  230.049561] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
clear port1 reset change, portsc: 0x603
<6>[  230.105521] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Resetting device with slot ID 1
<6>[  230.105564] [2: kworker/u16:17:19264]  queue_command : 
hcd->reset_resume = 739155968, xhci->reset_resume = 0
<6>[  230.105575] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
// Ding dong!
<6>[  230.105892]I[0:      swapper/0:    0]  xhci-hcd xhci-hcd.4.auto: 
Completed reset device command.
<6>[  230.105966] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Can't reset device (slot ID 1) in default state
<6>[  230.105974] [2: kworker/u16:17:19264]  xhci-hcd xhci-hcd.4.auto: 
Not freeing device rings.
<6>[  230.105995] [2: kworker/u16:17:19264]  usb 1-1: reset full-speed 
USB device number 2 using xhci-hcd
<3>[  230.106004] [2: kworker/u16:17:19264]  usb 1-1: udev->wusb=0
<3>[  230.106011] [2: kworker/u16:17:19264]  usb 1-1: set address start 
in reset resume<3>[  230.106018] [2: kworker/u16:17:19264]  usb 1-1: set 
address set reset resume as 1


--Pratham

On 4/13/2021 1:34 AM, Alan Stern wrote:
> On Tue, Apr 13, 2021 at 12:29:35AM +0530, Pratham Pratap wrote:
>> Hi,
>>
>> The current implementation of usb_port_resume
>> (usb_reset_and_verify_device()) can take up-to 60 secs in worst-case
>> scenario if the device (let's say the device went bad and is unresponsive to
>> any setup packets) connected went into runtime suspend and resumed back. Is
>> it fine to have a configurable upper bound? Since it can induce delay in the
>> overall system resume if the host is waking up from PM suspend.
>>
>> [USB port resume in worst case ]
>>
>> usb_port_resume()
>> finish_port_resume()
>> usb_get_std_status()
>> usb_get_status()
>> USB_CTRL_GET_TIMEOUT : 5 sec
>>
>>
>> usb_reset_and_verify_device()
>> SET_CONFIG_TRIES 3 (use_new_scheme: 2 /old scheme: 1)
>> hub_port_init()
>> GET_DESCRIPTOR_TRIES 2
>> operations < 3
>>
>>      2*2*3 (12) * 5(USB_CTRL_GET_TIMEOUT) = 60 sec
> I'm not sure where you got that 2*2*3 from.
>
> Is this a real problem?  How often have you observed this to happen?
>
> If you know any particular devices that die like this when they are
> suspended, have you tried adding them to the USB quirks list with the
> USB_QUIRK_RESET_RESUME flag?
>
> There is the usb "persist" parameter.  If you set it to false, what
> happens to this delay?
>
> Alan Stern
