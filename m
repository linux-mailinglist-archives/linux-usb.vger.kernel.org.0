Return-Path: <linux-usb+bounces-31539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E2CC7DB6
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 14:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3845304B3BB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 13:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFC13587D6;
	Wed, 17 Dec 2025 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z/Iv+dl3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAC1DE8BB;
	Wed, 17 Dec 2025 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977568; cv=none; b=Sz5bHc5kVoZjoNB3SUVsBXIdkcuuE7OpQcyhenUdlnGScxWfCap4nna9479i78c2lcS/aeiIngz4puyp/qDTiUAjld6IBWwxZGTp4EsuCEwzQsfAbviZ0MBhv5wEav7nJwJBGy6yUHgDxX4FDtviBVXrVgHmSFsNv7wdPO2ibzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977568; c=relaxed/simple;
	bh=Glh7M2DFadYC/Rjb4lOONBzreHwY/8BRTJlUhv4i1+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5cm9aC5j4HQBGlBiPxwVLautfclYFvxWzrX5yXBxBpaT2hssdOfOYVVGW6oRD4eB9zjJl9j9rOUDc4Yz3DDsag7Fn6w1W8p6EoENLzHaqf2GMfCkrOZtuM/lLLYdLKDr5mOKhDFXNG+I3OFx6iGfCOfVyYAGo5jLkvgmZy9njc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z/Iv+dl3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3553C4CEF5;
	Wed, 17 Dec 2025 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765977568;
	bh=Glh7M2DFadYC/Rjb4lOONBzreHwY/8BRTJlUhv4i1+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z/Iv+dl314u4tjP6ZfvQgl+IRLvJCoAe0qwvkLbZng6YBX1katZ38vlwiCwKSlwMk
	 PchaQS9ugcyaRfZJTGc+3Qy0iuuWU90YYR4AVYxJ9HoTIRVFT3y5A42mL3dt5eZnH1
	 YYSVb8YJF4XqiXkm3YcUQLlqEURbU5UyEvvr+HsQ=
Date: Wed, 17 Dec 2025 14:19:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: ucsi: Fix workqueue destruction race
 during connector cleanup
Message-ID: <2025121707-subwoofer-theme-ebe3@gregkh>
References: <20251017072250.3261616-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017072250.3261616-1-acelan.kao@canonical.com>

On Fri, Oct 17, 2025 at 03:22:50PM +0800, Chia-Lin Kao (AceLan) wrote:
> During UCSI initialization and operation, there is a race condition where
> delayed work items can be scheduled but attempt to queue work after the
> workqueue has been destroyed. This occurs in multiple code paths.
> 
> The race occurs when:
> 1. ucsi_partner_task() or ucsi_poll_worker() schedule delayed work
> 2. Connector cleanup paths call destroy_workqueue()
> 3. Previously scheduled delayed work timers fire after destruction
> 4. This triggers warnings and crashes in __queue_work()

<snip>

What ever happened to this?  If it's still needed, can you rebase
against 6.19-rc1 and resend?

thanks,
greg k-h

