Return-Path: <linux-usb+bounces-29789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40522C153AB
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB570566ADF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD128338F5B;
	Tue, 28 Oct 2025 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m768Ko2C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FFA238D54
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662423; cv=none; b=bVXzzXlnhaD7SLe7vb7O+MSHXo9CW9bz127ZBUSUrAV2RQ22xs1d7tv0XaKeH7AUjtH8XSLiBPFC91hIpSt6chUrdOI6ppcGJi2jDVx77GG2lYGWGdT2N6WdMSY9wUf+S2vJLByFiGIklt7bsY5+I3fVWh4mg8YWnX6nkfonayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662423; c=relaxed/simple;
	bh=2uV4AKH5GDeZKlte+oXpJZsFKXS8eNLYYoBK1xILXbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5DaLuxmyUdOfZ6F7Zfnb1H+inAxgBMzmBb2lmeiIDCdtIjRILKqxHoGK0FBbLMYbOmEulrcfUQlaPFamxSoC9z1d9f9hIWg94eHe2XJZwYipvrzDL92CrHOcelHzbBztZWU4KnG/QW9jWa2MWUHgv42gz6wIQTzRyWc+48TbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m768Ko2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16800C4CEE7;
	Tue, 28 Oct 2025 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761662423;
	bh=2uV4AKH5GDeZKlte+oXpJZsFKXS8eNLYYoBK1xILXbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m768Ko2CoYoLRDgNTN5Cah5I9KAjOsFPqnL3WZ2a8pAwIhL1PytyKBJM2rpnd2+SW
	 gHBcmTuJ1iSe2aFGa7MNZoDgbjohOJuOroa5PPFBU1Hkb96glIAvroYWhWrPx07ekb
	 OAm0No3lU0SUCcW/mIN7wF0zEAXhfH86elJuWs2I=
Date: Tue, 28 Oct 2025 15:40:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] uapi: cdc.h: cleanly provide for more interfaces and
 countries
Message-ID: <2025102857-surfer-atypical-2857@gregkh>
References: <20251028123254.1888303-1-oneukum@suse.com>
 <2025102858-doorframe-canola-e6c0@gregkh>
 <16a3c8ef-dd3f-48c4-afcd-42ab4b14c429@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16a3c8ef-dd3f-48c4-afcd-42ab4b14c429@suse.com>

On Tue, Oct 28, 2025 at 03:34:40PM +0100, Oliver Neukum wrote:
> Hi,
> 
> On 28.10.25 14:32, Greg KH wrote:
> > On Tue, Oct 28, 2025 at 01:32:22PM +0100, Oliver Neukum wrote:
> > > The spec requires at least one interface respectively country.
> > > It allows multiple ones. This needs to be clearly said in the UAPI.
> > > 
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > ---
> > >   include/uapi/linux/usb/cdc.h | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
> > > index 1924cf665448..5fcbce0be133 100644
> > > --- a/include/uapi/linux/usb/cdc.h
> > > +++ b/include/uapi/linux/usb/cdc.h
> > > @@ -105,7 +105,7 @@ struct usb_cdc_union_desc {
> > >   	__u8	bMasterInterface0;
> > >   	__u8	bSlaveInterface0;
> > > -	/* ... and there could be other slave interfaces */
> > > +	__u8	bSlaveInterfaces[];
> > 
> > Can this be combined with bSlaveInterface0?  Feels odd to have 0 and
> > then "more".
> 
> I am afraid the C language does not allow you to specify
> that an array must have a minimum length other than zero.
> In this case bSlaveInterface0 must be present.
> I don't think using only an array would be the right choice.

bSlaveInterface[1] ?

I'll add Gustavo here, he's done lots of work in this area.

> > Also, what determines how many, the overall length?
> 
> bLength - 4 is the number of slave interfaces, which
> must at least be 1.
> We cannot use counted_by in UAPI, can we?

I don't know, Gustavo?

thanks,

greg k-h

