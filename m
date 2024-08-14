Return-Path: <linux-usb+bounces-13460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5C951CB7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 16:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD13B26550
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 14:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2E91B32B2;
	Wed, 14 Aug 2024 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ozYJ8yos"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200391B29DB;
	Wed, 14 Aug 2024 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644657; cv=none; b=q/ZRQT421cTtFnreL7oKqPiTpSWaXK/Bpwb4PSAjQ1bc8r2XsAEGrrmy6JXDJ5Zm50wH+hzp3hjXa4nbUsqnUsEvttRdMz1SGXcrduqGUlRnK48RfJBeeKhNcviFuSUP1IyIrZpNWhSq9I0Q28NLw/GTI3z1hCwveeqnRDrEVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644657; c=relaxed/simple;
	bh=hCCjty/v60SA354Pxr2uEaeW8Dv/4vi7TJIYUUaevy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKu9JHKWDoAwqIKsVrhwP53iB/l6JPxQmD6btjkiN5HnywvV6crY/xb8FesFYXua8BGTG8ALzQDIawAJLSVLoxIyr3YZ+7OZCSNLqOGOMoFEtL5VelUpjPooWRYBEIWQkjk0ALE/he9R4nJG+1NSQGPfLvKShhNH0DVo6UXILKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ozYJ8yos; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347ACC4AF09;
	Wed, 14 Aug 2024 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723644656;
	bh=hCCjty/v60SA354Pxr2uEaeW8Dv/4vi7TJIYUUaevy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozYJ8yosQSFhH34ZznSyaDghpm8VIt8j/2JI+DRMvuPZVtBfNsf4fTrJIcQmrwOmc
	 WYMr6WoP/wGqm2PZaKAhBIyDMaSe7eF4kmTnSt0qfLvjtSQ+B3KJZ7KhlFu/jfVtQ5
	 1jrnIRgoavTicWT3vezfEa6dMbwBtRhx960MTUzc=
Date: Wed, 14 Aug 2024 16:10:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	m.grzeschik@pengutronix.de, jun.li@nxp.com, imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [RESEND] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Message-ID: <2024081438-power-surplus-d4d4@gregkh>
References: <20240814112537.2608949-1-xu.yang_2@nxp.com>
 <2024081405-sample-duckbill-ffec@gregkh>
 <20240814134802.tksdhu7yexuuknqy@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814134802.tksdhu7yexuuknqy@hippo>

On Wed, Aug 14, 2024 at 09:48:02PM +0800, Xu Yang wrote:
> On Wed, Aug 14, 2024 at 01:47:23PM +0200, Greg KH wrote:
> > On Wed, Aug 14, 2024 at 07:25:37PM +0800, Xu Yang wrote:
> > > Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
> > > isoc usb requests", pump work could only be queued in uvc_video_complete()
> > > and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
> > > we can only depend on uvc_video_complete() to queue pump work. However,
> > > this requires some free requests in req_ready list. If req_ready list is
> > > empty all the time, pump work will never be queued and video datas will
> > > never be pumped to usb controller. Actually, this situation could happen
> > > when run uvc-gadget with static image:
> > > 
> > > $ ./uvc-gadget -i 1080p.jpg uvc.0
> > > 
> > > When capture image from this device, the user app will always block there.
> > > 
> > > The issue is uvc driver has queued video buffer before streamon, but the
> > > req_ready list is empty all the time after streamon. This will queue pump
> > > work in uvcg_video_enable() to fill some request to req_ready list so the
> > > uvc device could work properly.
> > > 
> > > Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/gadget/function/uvc_video.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Why is this a RESEND?  What happened to the first one to require this?
> 
> I accidentally forgot to cc usb maillist in previous one. So I resend it.

Please always tell us why you are doing something, otherwise we have no
idea :(

