Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F4F6394E7
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 10:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKZJL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Nov 2022 04:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKZJL1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Nov 2022 04:11:27 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361AA1F62C
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 01:11:26 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id BFAC93200094;
        Sat, 26 Nov 2022 04:11:22 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sat, 26 Nov 2022 04:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1669453882; x=1669540282; bh=0SSFraBpauPKqV870t3MKzmlWuqxtBmfG3r
        tp/BzUqU=; b=LXkrLMPD9+mYvY2tbZKULvv5VZ/gp6SY5SAZzBZrbswcS3LArY9
        +AywWPj+nfdsCMC7irdKWALl7uDlVZrBNQi64bE9qaHpNe86Kawu7dag9c5XjWLO
        hIoGHJ1T3e5NaYhQ1RClakVnT/OY2AE+Ueo2W+v3iNPz1NVhPMbjxPOjSckfJVth
        osUnpuuONJM0kqT4EYyP0lb9MdaUzQjdSglhaV3aAXKNbcZH/qaQT+wqUXfpXfSj
        W78kf5niCEauLboNeKmWIaORqC2LSPjLXVgHV2bYo59G+aYQtJ68aOBhVwFa4fhc
        8CLthDUUsIfGc/f7KbGnpp7CEf5zWpfgYug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669453882; x=
        1669540282; bh=0SSFraBpauPKqV870t3MKzmlWuqxtBmfG3rtp/BzUqU=; b=Z
        /5T+wlcw6FjoCXBMTyTQDiZ+0FqaM7RDFMmZyTat9o+vdalUgAZ1NOTNrQKOoEwS
        VknsiAh1/miz8G+58oUE3/8SkiHUvHtNx5RRjCTgrkqZyNgXGi74zEFXWsn0dOx5
        OBCVQp3KIHZrpkVLmlgHcp6sL/dKmnmcwGYl8tz5kZ/83+XEkupXBq3tlwm+oQJK
        pgjJnAjNW6UDgqEyXtnmS/Qa5h+XDSbTf229aLB1cNz1+E0BGBSWMbcvaJ0A7dlD
        mHALV7bwl1Egc/tcShW+T7K9uSR4EE52wUwLcZc9EDeTfpwp52WbOmmV+5DHOq0Q
        U5yk895zLBu2CfsxFovnQ==
X-ME-Sender: <xms:OdiBYzwXGWBgPVogl2ND7kHib3vWhzAqBG2nG4Ml5z9nDrq1K7Jltw>
    <xme:OdiBY7To1DBbLnnwCJtYTLjqCtWV3-cU7o7hajAlvl2r_6nA-tAfvIxB5soenVq0e
    HBlxkIZt7MhWNfrVNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieejgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuvhgvnhcu
    rfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpedtgfeggfehieeiledvgfffleefhfevfffgffffieffkeekfefgieduveeitdfh
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:OtiBY9UkCanjAvdt_IuW2PVsQ-zVXRRMS2xHho72JrCnrLDn33XPHw>
    <xmx:OtiBY9h4Ox9-VTDg7_pfZfeh4V4ctS2osCzlV__8bv4zdWqspmhWHw>
    <xmx:OtiBY1BISK6PJ8MzkT3rH-sQP7BaB7klDxhR3vvuPPK_hO4VBKe8_g>
    <xmx:OtiBYy7HR7H4UlSMx_IcXt3CyU3WiMUgUrV61EhoEqzdBTgKvzrQCw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D8A08A6007C; Sat, 26 Nov 2022 04:11:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <dad79707-a778-4868-8684-f1658a38b4d0@app.fastmail.com>
Date:   Sat, 26 Nov 2022 10:10:48 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, asahi@lists.linux.dev
Subject: dwc3_set_mode vs. __dwc3_set_mode race
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

I've run into a race between dwc3_set_mode and __dwc3_set_mode accessing
dwc->desired_dr_role: It's an incredibly tight race that's hard to hit since
role switch events need to come in just after each other. It's reproducible
with an Apple M1 connected to a device that very quickly switches
roles when shutting down (which happens to be another M1). This sometimes
triggers a device->host->device switch sequence which is fast enough to hit this
race:

CPU A
	dwc3_set_mode(DWC3_GCTL_PRTCAP_HOST) // first role switch event
		spin_lock_irqsave(&dwc->lock, flags);
		dwc->desired_dr_role = mode; // DWC3_GCTL_PRTCAP_HOST
		spin_unlock_irqrestore(&dwc->lock, flags);
		queue_work(system_freezable_wq, &dwc->drd_work); // true, schedules __dwc3_set_mode

CPU B
	__dwc3_set_mode
		// ....
		spin_lock_irqsave(&dwc->lock, flags);
		dwc3_set_prtcap(dwc, dwc->desired_dr_role); // DWC3_GCTL_PRTCAP_HOST
		spin_unlock_irqrestore(&dwc->lock, flags);

CPU A
	dwc3_set_mode(DWC3_GCTL_PRTCAP_DEVICE) // second role switch event
		spin_lock_irqsave(&dwc->lock, flags);
		dwc->desired_dr_role = mode; // DWC3_GCTL_PRTCAP_DEVICE
		spin_unlock_irqrestore(&dwc->lock, flags);

CPU B (continues running __dwc3_set_mode)
	switch (dwc->desired_dr_role) { // DWC3_GCTL_PRTCAP_DEVICE
	case DWC3_GCTL_PRTCAP_HOST:
		// not executed since desired_dr_role is DWC3_GCTL_PRTCAP_DEVICE now
		break;

CPU A (continues running dwc3_set_mode)
	queue_work(system_freezable_wq, &dwc->drd_work); // __dwc3_set_mode is still running

CPU B (continues running __dwc3_set_mode)
	case DWC3_GCTL_PRTCAP_DEVICE:
		// ....
		ret = dwc3_gadget_init(dwc);


We then have DWC3_GCTL.DWC3_GCTL_PRTCAPDIR = DWC3_GCTL_PRTCAP_HOST and
dwc->current_dr_role = DWC3_GCTL_PRTCAP_HOST but initialized the controller in
device mode when calling dwc3_gadget_init. This obviously doesn't work and is
not easy to recover from.

Unfortunately we can't just lock dwc3->mutex since dwc3_set_mode may be called
from an extcon interrupt in atomic context (which is probably the reason for
deferring the mode switch to a workqueue).

Otherwise I can only think of creating a single-threaded work queue and
allocating a new work_struct together with desired_role inside dwc3_set_mode
and putting that onto the queue, i.e. something like:

struct dwc3_set_mode_work {
	struct dwc3 *dwc;
	u32 desired_dr_role;
	struct work_struct work;
};

void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
{
	struct dwc3_set_mode_work *work = kzalloc(sizeof(*work), GFP_ATOMIC);

	INIT_WORK(&work->work, __dwc3_set_mode);
	work->dwc = dwc;
	work->desired_dr_role = mode;
	queue_work(dwc->drd_work_queue, &work->work);
}

That way all role switch events will be executed in order and we can't race
desired_dr_role anymore.
I'm not very happy with that solution but can't think of anything else.

Any thoughts or ideas? I can otherwise prepare a patch.


Thanks,


Sven
