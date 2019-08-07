Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BB78466A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 09:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfHGHyu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 03:54:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:41106 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727413AbfHGHyt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 03:54:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 00:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; 
   d="scan'208";a="325881928"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga004.jf.intel.com with ESMTP; 07 Aug 2019 00:47:49 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Peter Chen <peter.chen@nxp.com>, Rob Weber <rob@gnarbox.com>,
        Peter Chen <hzpeterchen@gmail.com>,
        "mathias.nyman\@linux.intel.com" <mathias.nyman@linux.intel.com>
Cc:     Evan Gates <evan@gnarbox.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET USB testing
In-Reply-To: <VI1PR04MB5327B131A958695EDD251B8A8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190802200325.22897-1-evan@gnarbox.com> <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com> <20190807042500.GA10249@coops> <VI1PR04MB5327B131A958695EDD251B8A8BD40@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date:   Wed, 07 Aug 2019 10:47:49 +0300
Message-ID: <87v9v9l8m2.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Peter Chen <peter.chen@nxp.com> writes:
>> (Pinging Mathias regarding xHCI support of the USB 2.0 test modes)
>> 
>> On Mon, Aug 05, 2019 at 02:07:23PM +0800, Peter Chen wrote:
>> > On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrote:
>> > >
>> > > I'm trying to get my device to pass the EHSET tests.  I found the
>> > > thread "Using EHSET module" from March.  I'm having similar issues.
>> > >
>> > > I don't have access to the PID VID board that the lab uses.  Instead
>> > > I'm using another computer setup as a mass storage gadget but set
>> > > the VID:PID to 1a0a:0102 (TEST_J).  If that sounds like a problem or
>> > > there is another, better way to do this please let me know.
>> > >
>> > > > The usb-storage driver bound to your device first.  Try building a
>> > > > kernel without that driver and then it shoudl bind to the other driver.
>> > > >
>> > > > Or manually bind the ehset driver to your device through sysfs.
>> > > > Read up on the documentation for the "new_id" and "bind" and
>> > > > "unbind" sysfs files for how to do that.
>> > >
>> > > I did this.  I was able to unbind from usb-storage but binding to
>> > > usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both
>> > > the usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both
>> > > cases I got the same error.
>> > >
>> > > I did another build without usb-storage.  Now I don't have to go
>> > > through the unbind step but I still get the same error while probing.
>> > >
>> > >         [  296.089877] usb 1-1: new high-speed USB device number 2 using
>> xhci_hcd
>> > >         [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with
>> > > error -32
>> > >
>> > > I notice that it says "using xhci_hcd."  Is that a problem?  Does it
>> > > need to be ehci?  I tried a build without xhci but that caused other
>> > > problems for me.
>> > >
>> > > 1) Can I use a computer in device mode to present a VID:PID to get
>> > > into EHSET mode?  If so how should I do that?
>> > >
>> >
>> > Afaik, you can't. No Host computer will act as USB device. You may try
>> > to configure your box as USB device mode, for gadget driver, you could
>> > using legacy g_zero module, or source_sink function using configfs.
>> >
>> > > 2) What else do I need to do in order to get my box into EHSET mode?
>> > Only thing is your box need to be at host mode. For testing USB2 for
>> > xHCI, the mainline code should not support
>> > TEST_SINGLE_STEP_SET_FEATURE at my last access.
>> 
>> Today I was able to get access to a PID/VID test fixture that is used in USB 2.0
>> EHSET testing. Some of the major findings include:
>> 
>> 1. The only test mode that works properly is
>>    TEST_HS_HOST_PORT_SUSPEND_RESUME. All other probes of the ehset
>> module
>>    fail with errno -32 as shown above. This test mode is likely the only
>>    one to work because it does not set the PORT_FEAT_TEST feature for the
>>    appropriate port, but rather sets and clears the PORT_FEAT_SUSPEND feature.
>> 
>> 2. The same issue was observed on not only our custom hardware, but also
>>    a Dell XPS 13 running Ubuntu 18.04 with kernel version 4.15. I've
>>    attached the dmesg logs with xhci_hcd dynamic debug enabled for both
>>    hosts. The logs were captured while testing the TEST_PACKET test
>>    mode, but the logs looked similar for every other rest mode besides
>>    HS_HOST_PORT_SUSPEND_RESUME.
>> 
>> 
>> Mathias, I would appreciate your feedback on the attached dmesg logs with
>> xhci_hcd dynamic debug enabled. If you have a moment, could you please take a
>> look at the logs and let me know if there are any clues as to why the test mode is
>> not working with xhci_hcd? I've also attached the lsusb output for this particular
>> EHSET test fixture made by Allion.
>> 
>> I've been digging into the xHCI specification to see what details it might contain
>> about the USB 2.0 test modes we are trying to use.
>> Section 4.19.6 describes the proper sequence for enabling the USB 2.0 port test
>> modes. This requires setting the appropriate bits in the USB
>> 2.0 PORTPMSC register, which is described in full detail in section 5.4.9.2. It's clear
>> that xHCI should support the EHSET test modes, but we're not able to set the
>> appropriate port features for some reason.
>> 
>> My next thought is to double-check the logic of the ehset driver as it relates to
>> xhci_hcd. I would like to make sure that we are enabling the USB 2.0 test modes
>> according to the xHCI spec. I'm concerned that we might be experiencing an error
>> because we aren't setting the test mode acording to section 4.19.6 of the xHCI
>> specification.
>> 
>> Thanks in advance for reviewing the logs, Mathias! I appreciate any time and
>> feedback you may be able to provide. Let me know if you have any further
>> questions or need more information from me. I look forward to hearing from you
>> soon!
>> 
>  
> You may not enter test mode at all.
>
> Check flow: xhci_hub_control->xhci_enter_test_mode.

The thing is that we need to enable certification test as well,
otherwise we will never have a chance of getting linux products with a
USB-IF logo out of vanilla mainline tree.

Seems to me that the only thing missing is a way to enter a particular
test mode based on VID/PID pair.

All the functionality is already in place, just this little extra hook
is missing.

-- 
balbi
