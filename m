Return-Path: <linux-usb+bounces-17128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25E9BD063
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 16:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D502E1C215E5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 15:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C5C6F073;
	Tue,  5 Nov 2024 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="znjIZ/H0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE91F95A
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820756; cv=none; b=dvFOXkEVq42eRuODhyxN52y7ktpToAyvHVv8hoKzpq5/19ugastIPrpI/YKJbwlQFEF/2QARLxjMgIEI5gvmSdlEITX6vbHXcoHTcwGlzGVN6rL1CnBCBwth5DNRCcqP7hldy07vagl9CD/295MCYzQMdzYRdyJUIdFbIFdVdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820756; c=relaxed/simple;
	bh=Utn7D5hkCK1HoTyFYhM/8NHGBgz8IkTDjfueH+Kh/u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc9V0Vn5SIen493Z48BAlKY3uCvf+3xP5D7xYkrLKrAX62Jnr2p+7SEqajP8ktXZFudH5WdOFVZPM/aNgyJlkD/QzUrhlBUg7TeOGXY+fX3NV6AadbXRTFeJXNX/4sHpbKDU191M1dFgVdlaDCexTu0GqbhWkFMvEdvDXAM+YQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=znjIZ/H0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C98AC4CECF;
	Tue,  5 Nov 2024 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730820755;
	bh=Utn7D5hkCK1HoTyFYhM/8NHGBgz8IkTDjfueH+Kh/u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=znjIZ/H0sk8TM9SvdgWOT1MaJBURWBNbxEz3uniIDum/VCkflOaUgUEWGvKIiDjtf
	 YrM24ttPUFYJYFLUIXLkuGSCbnd0tyDLQg5WlyB1u/pdfSPBe+GsrVuUtCsF2f4Lo9
	 FVBHJDDWIAhV6Nms+dokbv+oC/B3lYEEKrXM5OtM=
Date: Tue, 5 Nov 2024 16:32:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219470] New: Add support for Apple USB-C Magic Trackpad 2
Message-ID: <2024110551-tinkling-trump-2243@gregkh>
References: <bug-219470-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219470-208809@https.bugzilla.kernel.org/>

On Tue, Nov 05, 2024 at 03:04:35PM +0000, bugzilla-daemon@kernel.org wrote:
> I'm happy to submit a patch, thanks!

Please just send a patch as documented and we will be glad to apply it.

thanks,

greg k-h

