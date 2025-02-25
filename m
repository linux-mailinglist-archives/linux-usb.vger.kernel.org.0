Return-Path: <linux-usb+bounces-21046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECEA44EBA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 22:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3D13ADDF0
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1705120C48E;
	Tue, 25 Feb 2025 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="LKrvjzfz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9911DF994
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518630; cv=none; b=LRO+hDNyNQgGP7UWSU/FuOlSRIyL4qYI0JlzYQQqNdQ6hX1cOkxvOkkxGHKdorpCWJ3vHVGf73rpfluvT7o50/HoCNSPyrM9/ZmNfcuoIoTkWTByllxVMOaec3dLOB8CGsXl7V0mIR/XsqZu5Vn7yHB+1YaXhOMbuBKylo6UaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518630; c=relaxed/simple;
	bh=9e5b+ExLgK2p2+BxW6jT8y+FhU5WN164n9eGn9MzGy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtuYmMS6HFTUudpkDkt7SCnggRS8Bz8hFu+8M10POJQeAkYj3uxn+TkowRGarreG/383tofBLZSZyov1mUqqOen7fltgnhPO04ReetA14U8wggOM/xqFi7QEegIiax1yeo4BBDiuQJPFO4yGci2yyx5sH0vgOI2R23Awji3EhoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=LKrvjzfz; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2A36A240103
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 22:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1740518621; bh=9e5b+ExLgK2p2+BxW6jT8y+FhU5WN164n9eGn9MzGy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=LKrvjzfzBGciSEIXr2NGc7U8HYBxDDSiCpbsW0MqZQdVO0wYrb7uSxgTPedXkfS0R
	 4324LQ5SiykN35CStB9V8cXAhKXBx5lvbd0mOc3WI5MZlnf+nheamyc8eEueB2g11j
	 vGM+lAiJbmP+d1qZVGBDQPh+QhuiJ3ShUYX7yGXbtudWps3/56fnc8ql0Vdv8HXIwf
	 T9ZyHfROnXLa9avZehvxtL+BMFL/LZvWkNL6ANxD0n05NevESL3ziktg5DA+ZF8NTT
	 IvtFiC3i/6HmdellNX3LOFuyPlPHOHOD3PPUIsIjqJD1LivqrmhdAgG/3/3+XWXg8o
	 wwdDLye5lUH3A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z2Vvw1c3Wz9rxB;
	Tue, 25 Feb 2025 22:23:40 +0100 (CET)
Date: Tue, 25 Feb 2025 21:23:40 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: j.ne@posteo.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] usb: storage: jumpshot: Use const for constant arrays
Message-ID: <Z7403OPZUf7WZ5Ai@probook>
References: <20250225-misc-const-v1-1-121ff3b86437@posteo.net>
 <a4e81827-b506-491f-8087-204044705c42@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4e81827-b506-491f-8087-204044705c42@rowland.harvard.edu>

On Tue, Feb 25, 2025 at 10:11:02AM -0500, Alan Stern wrote:
> On Tue, Feb 25, 2025 at 01:25:03PM +0100, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > These arrays are not modified. Make them const.
> 
> This does not explain _why_ you want to declare these arrays const.
> 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> There should not be two Signed-off-by lines for the same person.  You 
> should keep only the one with the email address you used for sending the 
> patch.  And it should have your full name, just like signing a legal 
> document.

Ah sorry, editing error on my part (I started the patch a while ago and
since switched to a different email provider).

> 
> > ---
> > 
> > This change was compile-tested with ARCH=powerpc
> > ---
> >  drivers/usb/storage/jumpshot.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
> > index 39ca84d6859122903de4e64b13e697e8b7d4ab31..089c6f8ac85fbb683cca8b03a2ff06c0ca776167 100644
> > --- a/drivers/usb/storage/jumpshot.c
> > +++ b/drivers/usb/storage/jumpshot.c
> > @@ -367,16 +367,16 @@ static int jumpshot_handle_mode_sense(struct us_data *us,
> >  				      struct scsi_cmnd * srb, 
> >  				      int sense_6)
> >  {
> > -	static unsigned char rw_err_page[12] = {
> > +	static const unsigned char rw_err_page[12] = {
> >  		0x1, 0xA, 0x21, 1, 0, 0, 0, 0, 1, 0, 0, 0
> >  	};
> > -	static unsigned char cache_page[12] = {
> > +	static const unsigned char cache_page[12] = {
> >  		0x8, 0xA, 0x1, 0, 0, 0, 0, 0, 0, 0, 0, 0
> >  	};
> > -	static unsigned char rbac_page[12] = {
> > +	static const unsigned char rbac_page[12] = {
> >  		0x1B, 0xA, 0, 0x81, 0, 0, 0, 0, 0, 0, 0, 0
> >  	};
> > -	static unsigned char timer_page[8] = {
> > +	static const unsigned char timer_page[8] = {
> >  		0x1C, 0x6, 0, 0, 0, 0
> >  	};
> >  	unsigned char pc, page_code;
> > @@ -477,7 +477,7 @@ static int jumpshot_transport(struct scsi_cmnd *srb, struct us_data *us)
> >  	int rc;
> >  	unsigned long block, blocks;
> >  	unsigned char *ptr = us->iobuf;
> > -	static unsigned char inquiry_response[8] = {
> > +	static const unsigned char inquiry_response[8] = {
> >  		0x00, 0x80, 0x00, 0x01, 0x1F, 0x00, 0x00, 0x00
> >  	};
> 
> There's nothing wrong with this.  However, several other source files in 
> this directory also have static arrays that are never written to.  Why 
> don't you change all of them?
> 
> If you do, it will be best to put the changes for each of the files in 
> its own patch, and then submit them as a series of patches.

That's a good idea, I'll do it.


> 
> Alan Stern

