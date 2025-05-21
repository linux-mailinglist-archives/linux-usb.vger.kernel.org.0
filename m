Return-Path: <linux-usb+bounces-24193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8DABF915
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 17:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB49B7B087E
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBDC1DE8B6;
	Wed, 21 May 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD7UaV+4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEF2AF1E
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840897; cv=none; b=dYvn1b2MMD7eV48c2xc6y5ucsOwZwlkGJIX2Hw9LCo2rxDmmEG+OIOk9NwSkDDSWyXH1Rcvg/na1sWDf9mTqJGe3+3nsVswRzkHRhdQJzSQvvvIsgwn6OZXsxOKkP9oAFCENgOWcFBBWdn/wI1wsIT3ZZ29tx2/8npZaeWEe00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840897; c=relaxed/simple;
	bh=N2REX4Kt++0BL8aKrlpu3HOl6wwvmUiIq5odXrpA2os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dearK42JgOUMeD5OpU+hLu+abMynG0GyBjbsTHZbToHxsY+vcCL3jPRCiLf/up3TsxNOU3wbnEe+go3AGmTRwO6j67LfzRvAHsuEL87OcYlv7CoB7C52Ce46xUpILHLV+5xZLWYg9FdfyVD/fredmokiLkTHnV/4nDxeq8+kR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD7UaV+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4FCC4CEE4;
	Wed, 21 May 2025 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840897;
	bh=N2REX4Kt++0BL8aKrlpu3HOl6wwvmUiIq5odXrpA2os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QD7UaV+4lSRdFKDIPgQRAFGH9Xyv1uOVF4sFxxkyDYFJLLHeatAi+Uoz62LbL9A3C
	 TDkF/vYsdUCD/sDi9X7vlouxaZeqEkYw8CTkUkwUwa3FAsPlZATAExrTqip41xZb9A
	 JqQiqRFmu4LluTrJH/JaVOxINALJdzZrPpiy90KZNS0T2GQyeqroUSXy72k1ceSBxQ
	 kh5nmyOh3hKqIu1lp0NWItvtRSc9KmCfPd/84qgVe/uuu09JKW7JO9DqA1eDsIfjfc
	 IUmrOOcEvOMHfhYQ1iJWE8K3Qq7aCJEzTkcMjOZquFxmrjmbF85Y2y+dQx5QHlQlrG
	 Tvvs+wn0iNWWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHlGB-000000001OL-0DL5;
	Wed, 21 May 2025 17:21:35 +0200
Date: Wed, 21 May 2025 17:21:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Subject: Re: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
Message-ID: <aC3vf5l4WacJcykH@hovoldconsulting.com>
References: <20250521132354.1104-1-charlesyeh522@gmail.com>
 <aC3u6uCMin_0SXWQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC3u6uCMin_0SXWQ@hovoldconsulting.com>

On Wed, May 21, 2025 at 05:19:06PM +0200, Johan Hovold wrote:

> I changed the summary to:
> 
> 	USB: serial: pl2303: a new chip PL2303GC-Q20 and PL2303GT-2AB

That was supposed to say:

	USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB

Johan

