Return-Path: <linux-usb+bounces-21758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B395A60B18
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D913A480A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 08:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9C01A23BF;
	Fri, 14 Mar 2025 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a3kqwwQR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE3EAD7;
	Fri, 14 Mar 2025 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940335; cv=none; b=K23ZCsJrBPIOcmIbTvWHWz1AQlhzMQez9v5U+VZXdCb5ouxCo17jt0ZYN0a0KMcn1yjX0/zmDiiHN6+kFMzYSTkm9SiYIAp1GbKlRJ7hpIXLoCqTh/w3pl3WslnM7LkepJJ1hdIKk4bng6iGXz9A/aLvuYO2mEWKJMVLvnp8oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940335; c=relaxed/simple;
	bh=tI0vTWKsMll0jdi/NKmbG4tSxmIKPnhKv6J/KH+XOzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inNe7KVghILR7WjvcPVPpNbUTMeWV5ae3QkBN+HUyBXOWq92ffuYfrJsBqjWwWFQKyR0AWcC80D7ildPsCuTBZ1SvKkqDdB5H53cqynawILoz3vebQoj3PKX8MzoBhJQw8rflip2oDB/OisB7OMXCTK7ibrd3LlM07I2RueCJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a3kqwwQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD6EC4CEE3;
	Fri, 14 Mar 2025 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741940334;
	bh=tI0vTWKsMll0jdi/NKmbG4tSxmIKPnhKv6J/KH+XOzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3kqwwQRWqf5O3pCiXGfkNxDN4q87FrBgOUhcZE7IwylEdukGJHa/a75LIax911x+
	 hl40fuEH+9aEgkXYPm5mXMiMabV3Kz2ufN6RtTc7HxA6G4TBCb4OjIPVHEHZAIYOFF
	 hpAOMz65/tXOqnfS4nqI6PM7VlLpnE6lwQXtCMSI=
Date: Fri, 14 Mar 2025 09:18:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <2025031443-rounding-subject-1f60@gregkh>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>

On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> the USB wake-up handling mechanism is integrated within the HSIO block
> control module, utilizing a dedicated wake-up interrupt. Therefore, we
> also implemented corresponding wake-up logic code to properly manage this
> functionality.
> 
> For detailed changes can refer to patch commit log.

Does not apply to my tree :(

