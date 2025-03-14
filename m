Return-Path: <linux-usb+bounces-21756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA321A60ACF
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A74516D445
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 08:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239DA194A65;
	Fri, 14 Mar 2025 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bNBf9cRh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B0189BB3;
	Fri, 14 Mar 2025 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741939793; cv=none; b=lJmoKTG+M71o1+UbeuxdV2dO/y4Zc8dR78aSRJ5KpyTmG32is9CMeu/0PYhs4eW0IM85gwiApnaCBGtJHzicdMrsp6R3jxEj/1mAc6Qy99nxHqCzO7NHkwyXPaX6XCKrJlhODvpjyxpYUuLO5lcSWfU2GeAkJK/5C6TJyujRnqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741939793; c=relaxed/simple;
	bh=3DOc5XgRYHRujpv/vCcX6GXenKoi0kmZS+HllmaFkXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d10id/0KZJRtv1aNXn7cnapr7F07Ysy3X/o50yZ+wid7EmR5ZCJE0HVVt0QZt+hTpAqgCb+iyOeEynzSStp7q81jeaOxUMAIVEsuJXfFiP4IJu6r3IsVHu9kuA22oIMOyFqgFjxtLwtoc4y5ERUlJJyBb/6RLF2v2eqmYpkwJcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bNBf9cRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4A5C4CEE3;
	Fri, 14 Mar 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741939792;
	bh=3DOc5XgRYHRujpv/vCcX6GXenKoi0kmZS+HllmaFkXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNBf9cRhXGKQOXxBYBQfP3evS7xu5BvaUyHzCqLUE2krtq9VgAq5jvYUCYEBpUp7J
	 Z4RItNAtBkTn30A4Y5V2H841hSqe3R9D4Gs3IwKd+dYV93WcZgw9Ph30FsRol2iJYO
	 0ANDRJgOlDcB35sHtKEcmrTZN0NghCCT1JXv46Ac=
Date: Fri, 14 Mar 2025 09:09:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8] usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
Message-ID: <2025031449-native-lankiness-2201@gregkh>
References: <20250308105356.53808-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308105356.53808-1-mitltlatltl@gmail.com>

On Sat, Mar 08, 2025 at 06:53:54PM +0800, Pengyu Luo wrote:
> The Huawei Matebook E Go tablet implements the UCSI interface in the
> onboard EC. Add the glue driver to interface with the platform's UCSI
> implementation.
> 
> This driver is inspired by the following drivers:
> 	drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> 	drivers/usb/typec/ucsi/ucsi_glink.c
> 	drivers/soc/qcom/pmic_glink_altmode.c
> 
> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014

This line should not be in the changelog.

thanks,

greg k-h

