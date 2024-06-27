Return-Path: <linux-usb+bounces-11723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE7E91A06A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 09:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C06251C2100E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114D64D11D;
	Thu, 27 Jun 2024 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqnpIone"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902304D8CF
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473389; cv=none; b=McQe/scoAMEI/SNPXaSEliBtYbeHo3dL0lOh7J2a+fxa4U2V2au1mMEggmD8Xb2+rw4TgkKcopWh6BG07z9sYzEz6nWwj0Mcu+dnZrRd6TbY0+q2rm6gXHswdiscnknwcOq8wQsffMGyd+a6zALBBM1OEyg93roP9U1dNDkqTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473389; c=relaxed/simple;
	bh=KK51XvgZfeJmU5FQtOzANC5/kKPerCeaF7qRpssoqhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h41z3mNDHU87mvUiJpa2/xue9tpKAuq4P2W7sUBj2cD2OHdP9rnO/5QQkawAeXbz0C+JB1T9xYPZ8bljy7bow4UNY14CAzODEgHu2v6UWEU1fQAp9FD5ybVLah1IFvl1zLk85F/NiHMeaSQcPpMa5X7OxXkWQY5WhJcScWJEhzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqnpIone; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCD6C2BBFC;
	Thu, 27 Jun 2024 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719473389;
	bh=KK51XvgZfeJmU5FQtOzANC5/kKPerCeaF7qRpssoqhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqnpIonel8er3VhW47Wi6iIXPfLt40Ods4BvasUkI5BqBWq7vnYjZEOgSRKINlzSP
	 wOt2qAU2m0udNxeeHGSUQVRsPv/0YOpnesL/8z1Yz4AjKvs91pwSOJaMjq4R9BDmPY
	 EarwJSWqKUPR+sq1qOMTXcch0o6n9BQlXzKoUYBdu6AnVED0aT92y0YR1L2PRFbZ6g
	 RZiFgdceWtwuFuFM/Y7UcLgkgezfDieDLMjoQHiebKF7ldkeHl1Uvd+XOgHjhtIZ6k
	 4QQNND7rKNYUzvU1DZu/OE2PkeqDCXTswQNPtkJUGnk5TRC1iJwtI4QtYB7vpGXL0x
	 8LPFQQxQp5qow==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMjZy-000000001My-18bd;
	Thu, 27 Jun 2024 09:30:02 +0200
Date: Thu, 27 Jun 2024 09:30:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FN912 rmnet
 compositions
Message-ID: <Zn0U-iQFuXiz7n0Z@hovoldconsulting.com>
References: <20240625102716.70515-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625102716.70515-1-dnlplm@gmail.com>

On Tue, Jun 25, 2024 at 12:27:16PM +0200, Daniele Palmas wrote:
> Add the following Telit FN912 compositions:
> 
> 0x3000: rmnet + tty (AT/NMEA) + tty (AT) + tty (diag)
 
> 0x3001: rmnet + tty (AT) + tty (diag) + DPL (data packet logging) + adb

Applied, thanks.

Johan

