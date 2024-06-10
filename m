Return-Path: <linux-usb+bounces-11053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC89019D0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 06:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78141F213BD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 04:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7252BB645;
	Mon, 10 Jun 2024 04:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wvX2vguA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2566FB6
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 04:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994385; cv=none; b=W1USJB9IWDP39Jajp7T8b3YkvU8wcmyM42fkG0TwwbDLUAHVDyhzACv9x/a0yKOrsWdH+cY1oYnrzA0Z4N9MLuAnC8527OneV4Y6cGQGCwxVdqRO6RcWdRyQmowGqlJITDB6bELH9ZzzSiZda6OBTq+C5xpFvPBWj7TjNUWYzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994385; c=relaxed/simple;
	bh=/U0B9K9gnliVgdyeKE5ES3uMh1Ahdfbc9bFbkE+Lzuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIAKK1m+pHeXA2tsPvfPACOHDpoq8ZUFujt+O5bKqN7zh/p00M0yQC8of+SfiyABy5dl6+JhDrDWE8q0O5U4eZnZ22hf6zrNIoB18Fv1nPKrlvzpObaCzXZLqUCXpOVH16IXYeFlezFKl+ROyhQiLP7eW+XLncuvJ5y5QQ/7ipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wvX2vguA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13149C2BBFC;
	Mon, 10 Jun 2024 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717994384;
	bh=/U0B9K9gnliVgdyeKE5ES3uMh1Ahdfbc9bFbkE+Lzuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wvX2vguA5PTnqD5ieIKz5z+CatN9eOaPPEpsypVBBazSmkCQjrX+LjT/6M7PEPWeG
	 B0txAycYjMxvZjadXPkyeNROhiMhRpDA7QxooPDYC8IMg2tif0n50d2Z/1kmSW1ZOs
	 wZzwKl8o48bj3KnHDNANP5B+GJhIAkIjYq5/EH+c=
Date: Mon, 10 Jun 2024 06:39:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Smirnov <d.smirnov@inbox.lv>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 1/1] usb: mos7840: Fix hangup after resume
Message-ID: <2024061022-blandness-rack-8c84@gregkh>
References: <20240609225850.3900-1-d.smirnov@inbox.lv>
 <20240609225850.3900-2-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609225850.3900-2-d.smirnov@inbox.lv>

On Mon, Jun 10, 2024 at 01:58:50AM +0300, Dmitry Smirnov wrote:
> Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
> ---

Sorry, but we can't take patches with no changelog text for obvious
reasons.

greg k-h

