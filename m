Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E7811AF1
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 16:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfEBOKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 10:10:14 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53510 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726197AbfEBOKN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 10:10:13 -0400
Received: (qmail 1589 invoked by uid 2102); 2 May 2019 10:10:12 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 May 2019 10:10:12 -0400
Date:   Thu, 2 May 2019 10:10:12 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Query on usb/core/devio.c
In-Reply-To: <1556802247.8016.16.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1905021009400.1475-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2 May 2019, Mayuresh Kulkarni wrote:

> Hi Alan et al,
> 
> I added the proposed IOCTLs of suspend/resume to the platform I am using
> internally. With that, I am able to verify below cases -
> 1. suspend -> wait-for-resume: resume caused by remote-wake from our USB device
> 2. suspend -> wait-for-resume: resume caused by host-wake (i.e. my test
> application sends a message to our USB device).
> 
> In both the instances, after wait-for-resume, I can see host scheduling L2 and
> actual L2 happens after the auto-suspend time-out expires (I am using default
> value for it).
> 
> Below are the URB snoops for each case -
> 
> Remote-wake -
> Here I cause the remote-wake activity on our USB-device approx. 20 sec after
> calling wait-for-resume.
> 
> [  218.299803] usb 1-1: ioctl-suspend
> [  218.299978] usb 1-1: wait-for-resume
> 
> [  222.022157] msm-dwc3 a800000.ssusb: DWC3 in low power mode
> 
> [  239.065016] msm-dwc3 a800000.ssusb: DWC3 exited from low power mode
> 
> [  239.145063] usb 1-1: driver-resume: runtime-active = 1
> [  239.145444] usb 1-1: wait-for-resume...done
> 
> Host-wake -
> Here I send the new command approx. 8 seconds after calling wait-for-resume.
> 
> [  152.760438] usb 1-1: ioctl-suspend
> [  152.760717] usb 1-1: wait-for-resume
> 
> [  156.068823] msm-dwc3 a800000.ssusb: DWC3 in low power mode
> 
> [  160.765638] usb 1-1: suspended..resume now
> 
> [  160.768442] msm-dwc3 a800000.ssusb: DWC3 exited from low power mode
> 
> [  160.823889] usb 1-1: driver-resume: runtime-active = 1
> [  160.823998] usb 1-1: resume done..active now
> 
> With that said, shall I send a patch of above changes for review, rebased to
> usb-next branch - https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> /log/?h=usb-next?

Yes, please do.

Alan Stern

