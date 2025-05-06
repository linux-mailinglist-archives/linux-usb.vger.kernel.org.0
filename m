Return-Path: <linux-usb+bounces-23769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F8AAC978
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 17:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A12D3BA8BF
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A14F283C8D;
	Tue,  6 May 2025 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fablclq5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66883283150
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545262; cv=none; b=er3QGSx592fC45V0vBGVcDyjQ/cA9idCgMbFwjztft+NtSDHkwyb8rez0lsjQVomgk3jrJdlfgAV/VASe4EbNapD3UI0yT9LAmwoUQORqQvCMOZp6rPg+mrVJh2jsz6EB8QpIlrWtGNOSiUDy4jOXZNICR6/30BTJ5KoVWfiol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545262; c=relaxed/simple;
	bh=uPSORdcqXq2xYFxZhmmnvucNpAZCJOtNWVG/VnZV1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3rfguvu1pnG2iLVctpd1iSDuO4qCnCP0XRZqp3UIIDCfeiIW0N5h4mOdhM4pH1TXUn5FBY34oCFIgRd3kQfFwjtqVDIYj7TX7ex4hzVJnr9gPVfrYrVth2Dcfua51UNCw267Ch1GYHKtbsx51CS0XjA9YmUT5Q5PiGUJCvODNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fablclq5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71233C4CEE4;
	Tue,  6 May 2025 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746545261;
	bh=uPSORdcqXq2xYFxZhmmnvucNpAZCJOtNWVG/VnZV1xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fablclq5f9MlgrabBPOPbmtvnoQuHqhKSoDWcyNihpbqeKjlHUnT/zO1uZBNkDOKq
	 /TC5KmagUsLopfFaz4o26FENqqHCG9APVIAexXf9hDjOfaNsfOqqrDGxBmbtkoQjKt
	 s8oOxYrDr0T4vrVcwvgwAYShVSh8ENhfHLwGWj+o=
Date: Tue, 6 May 2025 17:27:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Asaf Kampf <asaf.kampf@exodigo.ai>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"alon.barlev@gamil.com" <alon.barlev@gamil.com>,
	Yoav Derman <yoav.derman@exodigo.ai>
Subject: Re: ucsi_acpi: crash ucsi_reset_ppm [typec_ucsi]
Message-ID: <2025050618-amid-ferry-5b38@gregkh>
References: <DU0P190MB1980848113ED5AD6E39C0A15E189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
 <2025050621-embody-wobble-3610@gregkh>
 <DU0P190MB1980AA5ADE81657C64E4830AE189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0P190MB1980AA5ADE81657C64E4830AE189A@DU0P190MB1980.EURP190.PROD.OUTLOOK.COM>

On Tue, May 06, 2025 at 02:44:08PM +0000, Asaf Kampf wrote:
> Updated the kernel to Linux version 6.14.4-061404-generic  - the issue persist.

I do not see a crash in your output on this kernel, so are you sure it's
not working properly now?

confused,

greg k-h

