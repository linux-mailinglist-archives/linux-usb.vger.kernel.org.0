Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC063FD34E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 07:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242139AbhIAFu5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 01:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:45414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242061AbhIAFuz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 01:50:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D68C661074;
        Wed,  1 Sep 2021 05:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630475399;
        bh=2KIkF4WFVpleZUM1Y9Fdd0veoZytAEIweQKu11j5i1c=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=UxcfMcW/t6QlXNx8ffJQ7yjeECxEFAf88AjN1Yk7KKhqYb/IToUbCThjnTvjnGGFJ
         9YG79aAls7DdKHuWjugf4fMbDQURdd8x9/7v+foRIXLINt6EAtXe0Eb+NUXw6HUnkf
         9RIQUyqWiEgk0mELaaDd+sNEtmNuZiF30CvYJMgm7p2yjfA7GgNpSTRrDRenhQ6F+O
         rNz0le6WT0OdfrISwf0p6Vp+JdMYCDphQPiVZLv0/SxR3iuflfBmy5iZuAqxs4gKPW
         YoaWCOG9Q1qZ1/k5w+7dPpy4ix4KkYlyT0rEVwxo+jTyzPG54TtYN5X8wNOXyEZrmw
         jyzTfxIZsl1tw==
References: <20210831174742.105621-1-faizel.kb@dicortech.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     "faizel.kb" <faizel.kb@dicortech.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: testusb: Fix for showing the connection speed
Date:   Wed, 01 Sep 2021 08:49:41 +0300
In-reply-to: <20210831174742.105621-1-faizel.kb@dicortech.com>
Message-ID: <87eea8deuz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


"faizel.kb" <faizel.kb@dicortech.com> writes:

> 'testusb' application which uses 'usbtest' driver reports 'unknown speed'
> from the function 'find_testdev'. The variable 'entry->speed' was not
> updated from  the application. The IOCTL mentioned in the FIXME comment can
> only report whether the connection is low speed or not. Speed is read using
> the IOCTL USBDEVFS_GET_SPEED which reports the proper speed grade.  The
> call is implemented in the function 'handle_testdev' where the file
> descriptor was availble locally. Sample output is given below where 'high
> speed' is printed as the connected speed.
>
> sudo ./testusb -a
> high speed      /dev/bus/usb/001/011    0
> /dev/bus/usb/001/011 test 0,    0.000015 secs
> /dev/bus/usb/001/011 test 1,    0.194208 secs
> /dev/bus/usb/001/011 test 2,    0.077289 secs
> /dev/bus/usb/001/011 test 3,    0.170604 secs
> /dev/bus/usb/001/011 test 4,    0.108335 secs
> /dev/bus/usb/001/011 test 5,    2.788076 secs
> /dev/bus/usb/001/011 test 6,    2.594610 secs
> /dev/bus/usb/001/011 test 7,    2.905459 secs
> /dev/bus/usb/001/011 test 8,    2.795193 secs
> /dev/bus/usb/001/011 test 9,    8.372651 secs
> /dev/bus/usb/001/011 test 10,    6.919731 secs
> /dev/bus/usb/001/011 test 11,   16.372687 secs
> /dev/bus/usb/001/011 test 12,   16.375233 secs
> /dev/bus/usb/001/011 test 13,    2.977457 secs
> /dev/bus/usb/001/011 test 14 --> 22 (Invalid argument)
> /dev/bus/usb/001/011 test 17,    0.148826 secs
> /dev/bus/usb/001/011 test 18,    0.068718 secs
> /dev/bus/usb/001/011 test 19,    0.125992 secs
> /dev/bus/usb/001/011 test 20,    0.127477 secs
> /dev/bus/usb/001/011 test 21 --> 22 (Invalid argument)
> /dev/bus/usb/001/011 test 24,    4.133763 secs
> /dev/bus/usb/001/011 test 27,    2.140066 secs
> /dev/bus/usb/001/011 test 28,    2.120713 secs
> /dev/bus/usb/001/011 test 29,    0.507762 secs
>
> Signed-off-by: faizel.kb <faizel.kb@dicortech.com>

Acked-by: Felipe Balbi <balbi@kernel.org>


-- 
balbi
