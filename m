Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCD33F5D46
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236056AbhHXLpG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:45:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234787AbhHXLpF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:45:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01A19613AD;
        Tue, 24 Aug 2021 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629805462;
        bh=i6vzf71mqlIplks2DK4fwDkUBEEYF3cxt1glm6MoSSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PfuU+8BAssSjh41Qf4csLl7wb7G0U/8UWQ472AMIsd6CZtjtD3Fy4NF7SnvOCpObb
         4dSadq7rdWggCr7/VfRKGetiKXAyP/Y9kWI9Wp9IKEGlaXLjIHAlGBj6MMSjbb1UWi
         q5QB27xF828Jn3ulSgnUdvljME66bFMnqVxIZQBRd5s6cST+js91FrF3slKHibgTKq
         5sCZEIu8Gtdj10yaXWO+Aj+8OHOxpR06WE4J79zjDjWZqlCZc48NX9JScZMzxuRy2U
         fVTFex7/NratnB/vchT5MH2gEYs1Qyn0ox8xiBa9E1ywF/ivrwu9i8J1oz1EiG/JSp
         RVs1fzHiKWJOA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mIUqn-0004rf-F3; Tue, 24 Aug 2021 13:44:17 +0200
Date:   Tue, 24 Aug 2021 13:44:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 214131] ch341 communication problem
Message-ID: <YSTbkTsOofFkr3CH@hovoldconsulting.com>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
 <bug-214131-208809-j9da9chxlu@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bug-214131-208809-j9da9chxlu@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 23, 2021 at 09:14:49AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=214131
> 
> --- Comment #5 from Paul Größel (pb.g@gmx.de) ---
> I agree, I couldn't find any enumerate related symptoms here:

I was able to reproduce the problem here. The device doesn't send a
zero-length package in case the received data is a multiple of the
endpoint size so that the bulk transfer doesn't complete (e.g. your
flashing application may not receive replies).

We need to revert the offending commit until we can figure out how to
configure the device to send ZLPs.

Thanks again for reporting this, and sorry about the breakage.

Johan
