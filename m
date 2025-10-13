Return-Path: <linux-usb+bounces-29199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816EBD1C64
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4E6E4E108C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF0C2E88A7;
	Mon, 13 Oct 2025 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PkknBuHz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C592E7192
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340394; cv=none; b=VnSFu/Ms/lxMVx6DAN4jM5Myyfv3xI3xfHi60M3Ypd30r6LOYnBzUlVgsU9gTJqy5BTMb1EoYOLwX1R1ed3tW5ZCYJBGXz4yjExUz6y5XkpcjHD9IHT8ejIqSGbf95VbFERHGBdUfiabdcG6Hg0zcXCZbzW4GyZkZ+nqp5igSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340394; c=relaxed/simple;
	bh=k7C5r5aegrXKahpmohe1aorDOqgW8HlRsMLevrBYqOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjlEIavbosidKLXe2F7j8m0uPscB/qBUbOcOw/zjjzd03/90RdU64rBpEMP7kBZVL9GvVw+9/0F0dlMB9AkmYBQnaxCACRpWTbHYmEs2AwoHKTJbcb8Og5OicMgU6Wz8X6tcuKgJ3TJOw6o9mwwcvdU7pRSA+XNr6aFU1KCyTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PkknBuHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31466C4CEE7;
	Mon, 13 Oct 2025 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760340393;
	bh=k7C5r5aegrXKahpmohe1aorDOqgW8HlRsMLevrBYqOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkknBuHzWtOdHENHksD/w5blyNlfsLictZtcghTRw5LNd7i8QI1Q9lR8xT+yS984V
	 OhfKg+49NdosWlkic0+++ecOKFz+su0uUsSXmW9Vf/URPYp5r4ltQ9AQdlkpIZeol4
	 X4ZuJTF/3EtMSa4Ta8EdIXx1/q+VA81TXC4NQYrE=
Date: Mon, 13 Oct 2025 09:26:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 1/2] usb: ljca: Order ACPI hardware IDs alphabetically
Message-ID: <2025101353-unbeaten-kisser-6faf@gregkh>
References: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010055625.4147844-1-sakari.ailus@linux.intel.com>

On Fri, Oct 10, 2025 at 08:56:24AM +0300, Sakari Ailus wrote:
> The driver has three lists of ACPI hardware IDs, for GPIO, I²C and SPI.
> Order them alphabetically.

In the future, please say _why_ you need to do such a thing.  The code
will work either way, and as Alan said, this will get out-of-order over
time :(

thanks,

greg k-h

