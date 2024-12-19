Return-Path: <linux-usb+bounces-18683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E134C9F810E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 18:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782C01894F2A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 17:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF8C1990B7;
	Thu, 19 Dec 2024 17:04:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB819F13B
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627850; cv=none; b=LfXTZv5F98Kh6cYWjOsnSgBXXar+CbT3sHJhncsq0pmz+y0XsAw8VD+KyG0SN1NQVuqgOK3Jd9ow8CbZOIIZLep9TfgY7HHpfyHK0f5gCP9pQgUspmtUvIPiP9OjwBcCBDMojapV8z1VbfdnRrmwjh7L14SW+HdVhWZ5303TADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627850; c=relaxed/simple;
	bh=6SA51kiVKTE8ZEK6+ziQbML5B7jj3x4Ic22iBFavwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+YCMYSk23DX7w62XgO+apm9TEvId9DEuuLJpnhpa7Wwmy5M58NOk06c27tFe74oFV5Dgt4NWcEuFTeXMf/ub204Hl4wteTbv/uW7pkxSLRKbfVzKwtBxGRpY6F9NYTFbt+FmSqgEfAIgYVhSpdx83nhesLGrAQ4y8/BcKVYn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 4659A2800B484;
	Thu, 19 Dec 2024 18:03:58 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 31B54700A42; Thu, 19 Dec 2024 18:03:58 +0100 (CET)
Date: Thu, 19 Dec 2024 18:03:58 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 12/12] thunderbolt: Handle DisplayPort tunnel activation
 asynchronously
Message-ID: <Z2RR_r_AjyluYNwW@wunner.de>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
 <20241217082222.528602-13-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217082222.528602-13-mika.westerberg@linux.intel.com>

On Tue, Dec 17, 2024 at 10:22:22AM +0200, Mika Westerberg wrote:
> In typical cases there is always graphics driver loaded, and also all
> the cables are connected but for instance in Intel graphics CI they only
> load the graphics driver after the system is fully booted up. This
> makes the driver to tear down the DisplayPort tunnel. To help this case
> we allow passing bigger or indefinite timeout through a new module
> parameter (dprx_timeout). To keep the driver bit more responsive during
> that time we change the way DisplayPort tunnels get activated. We first
> do the normal tunnel setup and then run the polling of DPRX capabilities
> read completion in a separate worker. This also makes the driver to
> accept bandwidth requests to already established DisplayPort tunnels
> more responsive.

Does this mean one has to add that command line option unless i915
is already loaded on boot (or built-in)?  I can easily see i915
not being in the initrd for some reason but being loaded only
after the root filesystem is mounted.  And that in turn may
take a while if the user has to enter a password for disk encryption.
If the user has to add a command line option in such cases I think
that would be very inconvenient.

Thanks,

Lukas

