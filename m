Return-Path: <linux-usb+bounces-35450-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFC3MNnDw2kVuAQAu9opvQ
	(envelope-from <linux-usb+bounces-35450-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 12:15:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0B323BE8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02F8930863C2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBCA3CA4B8;
	Wed, 25 Mar 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUdPQ8Y8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB513CE4BD
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436995; cv=none; b=V5Syc7JcdMmnlaJk6MJdvijgHdezsU0vWnZAP+9dRTVCLXSPDyRZJm+1ZBqyw6yp8cgLOQ7zPPNgYnQhWmi2KXyikAUISozcdZbsxJs7COI5zhd84HJJ9ZP/tzPg54ZxxtYlxjGMq3V8nVAa0UJzKs4L+eI3tDBeuGJkhDiqvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436995; c=relaxed/simple;
	bh=Nb5t1Ac0Gt9BuEcT1gKeoz7g+HMS+azfePVGae+Bd2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnMS4o4jAVAZoKUzdn3/zRjeOvmXvs5dBiXE+fv3I441RlZotfQ2CaEnN3VvBfV19HarY84Lntu98cPh2MKUTD0EG+X4S+8K3+1vzOuyGJZ107B2jWdV5s8W2KunGqAvKGyA6WHpe5FUieJi17iLsSPsIlgrKh9vraXAvj9mMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUdPQ8Y8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so4619388f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 04:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774436990; x=1775041790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XfO9Z2lWl5MXFniiv+EbGxhInhKb23qjBJTY9QWd0x0=;
        b=eUdPQ8Y8i3mUO2IKE894cfNOL0jULl/2mTkNMoJFqGX8oOov4B03asxg725quwllDI
         hzncTd9SMITM91LeUcLQRPI/r8EIifODigemvmIev6pBu191yb4Yup20GKkENCwnmEFH
         brFiRAx5jUBG3AA422CLi5g6OhSAJr1P5r8JjgBtjm4qF1rvFDg32DI51OB7OsIu9ebz
         Q0Zx0bxUI2rxZt8bWhGa9JwixtG7SdUzYFYSnixpOE6NjE6C5JifBSpdQlsyVxq1Mgnn
         7SQXkv5WGLJmij9uhvYCHezXDYTtnwmFWMd5Z+bdgDGlXHlkZU1H6LgYY59l5Lh0Z0mn
         iGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436990; x=1775041790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfO9Z2lWl5MXFniiv+EbGxhInhKb23qjBJTY9QWd0x0=;
        b=SXhc8tq4lVVFgs24mxmi7t1pfvTVmIykQ+7KGQCwHX5KRJODNQoeM7SERYxQqgFnEw
         vMyojl+u2KD2BIO05N/ZhOuN+5JZBqsMBwwvSWPNJSJvtJcGBT3k/tqeOwPNEl4LFHFz
         YnctEjDCJleorSGSYc6brc5uJraN0ZHMP9n1NlVUGo/xAuYSDuPWRhJxYtjM15iUac5v
         hj8W7s8r7eeYdGhZCMHUKhsr1rOZRSFW/F/kaaRkxnTGQ4xpvESwuoiba7JauQ0IOZ6R
         UxjfzrZOGCWq+8LuJWfa9rcxJgUhaliXCN7u+K1W64eljp08OOTwh0JPSHWfBV1A0dUY
         I1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXaZdSjka3xwMlOyb9fP+4WcH2J7CAQzOdWo8dCBQsqLonEjudE+CAMzUmWFlGl+XcahqIlq4J/Jdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iDRhJzLq19tZ/H1ANSa/hJcoX2pKnaZlL25GSkZugToNUCjJ
	u7Po4j+3/1NfSb9vRUazCn3av7cRhUoA09WtmEQr5QQXcOwcTqu4r9bKRJ4EZltH6Jc=
X-Gm-Gg: ATEYQzxFRpykcVOxun3FcW1kLjqSI90Jq4G+E616L+zb4v8g4Gz3E+s3NvUM9thVhb/
	WYZnrTW7nclkzDmyw+cHXyAOghN+cgMOSq4nsRGaSM2pQ8oRHRclttsqqSYJsZlLQw5Zxrlfubc
	CiSLeTYU7x894veO6a5PXSEevHdmxcYX+Fa3gJJ/ORB1+xuxgjl+lspr1E2l91+J1SGCygfGZ9+
	miTD7ZgddMClbdRfx4ds9HGLCSoXUG+oafhum8gCtvo61JBNz4OPTfNux9EbZv/gwPKVBSMyBmv
	h+duqtkc2qc+IVokRWAcObu5NEHi87U1eZ0u7XMLa7UtY7upeNWLfllTo1L+dRxDmCIkfJMl9AK
	BFtySFAqxEYWw5COWLGh1seV16BSWkWUS7zJpN8p/ONKNh0qoBWzR6rUhPIVbHiLkmf0WgQ/F8Q
	11uMmHe+WyEEo3l7ENzhAgD9+QLIL4bop8pTypXgA=
X-Received: by 2002:a05:6000:4285:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43b88a0fc0bmr4525201f8f.35.1774436989849;
        Wed, 25 Mar 2026 04:09:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm46355279f8f.18.2026.03.25.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:09:48 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:09:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Ai Chao <aichao@kylinos.cn>, gregkh@linuxfoundation.org, b-liu@ti.com,
	johan@kernel.org, badhri@google.com,
	heikki.krogerus@linux.intel.com, valentina.manea.m@gmail.com,
	shuah@kernel.org, i@zenithal.me, tiwai@suse.de, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, prashanth.k@oss.qualcomm.com,
	khtsai@google.com, tglx@kernel.org, mingo@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
Message-ID: <acPCeSEDtvtrcQLI@stanley.mountain>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
 <20260310094434.3639602-7-aichao@kylinos.cn>
 <b49bc467-8c51-41fc-a7ee-5770a9720deb@linuxfoundation.org>
 <abEYSBb8LJo9iVPL@stanley.mountain>
 <4328a59a-a02b-491f-92a5-4dbd10ee77c2@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4328a59a-a02b-491f-92a5-4dbd10ee77c2@linuxfoundation.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35450-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 67C0B323BE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 03:34:03PM -0600, Shuah Khan wrote:
> On 3/11/26 01:22, Dan Carpenter wrote:
> > On Tue, Mar 10, 2026 at 04:10:20PM -0600, Shuah Khan wrote:
> > > On 3/10/26 03:44, Ai Chao wrote:
> > > > Use a safer function strscpy() instead of strcpy() for copying to
> > > > arrays.
> > > > 
> > > > Only idiomatic code replacement, and no functional changes.
> > > 
> > > It is a functional change since it calls a new routine. Get rid
> > > of this line from change log.
> > > 
> > > How did you test this patch? I am curious because of you are
> > > describing the change as "idiomatic code replacement"
> > > 
> > 
> > I liked the commit message...  To me it says that patch affect
> > runtime.  It doesn' fix any bugs or introduce any bugs.  Too often
> > these changes are sold as a "potential" bugfix, which means people
> > haven't bothered to check whether it fixes a bug or not.
> > 
> > It's the right thing to add a note under the --- cut off that the
> > patch hasn't been tested.  Testing isn't required for this sort
> > of patch but a note is good so reviewers will know to be careful.
> 
> I would like to see some sort of testing for patches like this one.
> It isn't hard to test this change.

It would take me a while to figure out how to test this. :P Presumably,
it's:

sudo ./tools/testing/selftests/drivers/usb/usbip/usbip_test.sh -b<busid> -p tools/usb/usbip/

but I couldn't figure out what to supply for a busid...  Does
kernel-ci do usbip testing?

regards,
dan carpenter

