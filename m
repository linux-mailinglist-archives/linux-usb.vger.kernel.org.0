Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1353E23AC80
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgHCShe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 14:37:34 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35533 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726130AbgHCShe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Aug 2020 14:37:34 -0400
Received: (qmail 115512 invoked by uid 1000); 3 Aug 2020 14:37:33 -0400
Date:   Mon, 3 Aug 2020 14:37:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yasushi Asano <yazzep@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com,
        jim_baxter@mentor.com, wnatsume@jp.adit-jv.com,
        nnishiguchi@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter
 for usbcore
Message-ID: <20200803183732.GA112453@rowland.harvard.edu>
References: <20200730104226.3537-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730104226.3537-1-yazzep@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 07:42:26PM +0900, Yasushi Asano wrote:
> From: Yasushi Asano <yasano@jp.adit-jv.com>
> 
> Dear Alan
> Dear Greg
> 
> I would like to have a consultation with you. The customer's product
> board needs to get a USB certification and compliance, but it can not
> pass the test using the current USB hub driver. According to the USB
> compliance plan[1], the“6.7.22 Device No Response” test requires the
> detection of device enumeration failure within 30 seconds. The
> kernel(USB hub driver) must notify userspace of the enumeration failure
> within 30 seconds.
> 
> In the current hub driver, the place to detect device enumeration
> failure is [2]. I have modified the hub driver to issue a uevent here,
> but the procedure of device enumeration (new_scheme+old_scheme) takes
> too long to execute, it couldn't reach [2] within 30 seconds after
> starting the test.  According to the result of PETtool [3], the state of
> "Device No response" is that usb_control_msg(USB_REQ_GET_DESCRIPTOR) [4]
> in hub_port_initn times out. That means r == -ETIMEDOUT.  because of the
> default setting of initial_descriptor_timeout is 5000 msec[5],
> usb_control_msg() took 5000msec until -ETIMEDOUT.
> 
> I will try to describe the flow of device enumeration processing
> below[6].  If my understanding is correct, the enumeration failure [2]
> will be reached after performing all the loops of [7][8][9]+[7][10].  In
> the new scheme, 12 times check will be performed ([7]/2*[8]*[9] => 2*2*3
> => 12).  In the old scheme , 4 times check will be performed ([7]/2*[10]
> => 2*2 => 4).  In total, it checks 16 times, and it took 5000msec to
> ETIMEDOUT every time. Therefore, It takes about 80 seconds(16*5000msec)
> to reach [2]. This does not pass the "Device No response" test.

I agree with Greg, we don't want to add module parameters.

The problem is that we make up to 16 attempts, and each attempt can take 
5 seconds.  We need to decrease the number of attempts to 6; then the 
total time will be 30 seconds.  We also need to keep both the old and 
new schemes.

So let's change the code to do 3 tries with each scheme.  For example,

	3 * new scheme, then 3 * old scheme, or else

	3 * old scheme, then 3 * new_scheme,

depending on the old_scheme_first parameter.  Change the loops in [7], 
[8], [9], and [10] so that each iteration does the next item on this 
list instead of starting back at the beginning.

(Or maybe it would work better with

	2 * scheme, then 2 * old scheme, then 1 * new scheme,
		then 1 * old scheme

with old and new swapped if old_scheme_first is set.  I don't know.)

Anyway, can you write a patch to do this?

Alan Stern
