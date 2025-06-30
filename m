Return-Path: <linux-usb+bounces-25264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17308AED3AB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 07:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50078188CD5E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 05:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E350219E82A;
	Mon, 30 Jun 2025 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EcrHpglA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689AE2745C
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 05:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259893; cv=none; b=mVnytzCybH7kY7DhwiECwqnKyYkUbB/uG19twZgD7UMisz972Tu0CHhX6sI2enh4joMPNSoNhg4ZK+x5t8LJ5dcWlE6CZ2mMRaKsIGCfd85e9TvR5j/uAjKx3+9CZcrr2hZuUDykHQrL4Arn9X1NIRMimMnBatyzxTd7VfGzK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259893; c=relaxed/simple;
	bh=n8oZYusZVh/t7KZ+OvLxsfm8D5VezK0+kcvDDGdfDD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbSN45oDkPb3SQAp+WUVvgj1/iXIoBcAgH8ojO1Tg0JguxYDPx0B/DdBoKTrxzGGyFObZGJkHjSEjS7gKf4tgpvOLD/pJJeJ53NYdx8R1HOd6te+NcPQnEFTAyOXY4UD+xIPFfwmNmuQPzLi1EeGxdF0sQ+cE0+kFdQgbeJdPBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EcrHpglA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83385C4CEE3;
	Mon, 30 Jun 2025 05:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751259892;
	bh=n8oZYusZVh/t7KZ+OvLxsfm8D5VezK0+kcvDDGdfDD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcrHpglATsbzRy6WL/cwfrBryyDkaYggHcFkw25y3Aaf2OE7BOWV77mb+MAV1vajp
	 v/mkdyr0mjumnTjmWBxbxqnvvc08sSD/ndF6Y/xQuGzE8RVoFu1Rzm5FBA3ETZ2B26
	 gmdcWcPNuOvs6+cT6HLbOmQeQsCL7DI+jdu6WjQc=
Date: Mon, 30 Jun 2025 07:04:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Jayaraman <venkat.jayaraman@intel.com>
Cc: linux-usb@vger.kernel.org, pse.type-c.linux@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <2025063027-usual-acrobat-703c@gregkh>
References: <20250630001556.651826-1-venkat.jayaraman@intel.com>
 <2025063018-stunt-hamstring-0331@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025063018-stunt-hamstring-0331@gregkh>

On Mon, Jun 30, 2025 at 07:04:14AM +0200, Greg KH wrote:
> And what are the units of these files?

nevermind, that's in the file output itself, I missed that first look.

greg k-h

