Return-Path: <linux-usb+bounces-16380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD169A2532
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 16:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF651C2334E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 14:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3DC1DE4ED;
	Thu, 17 Oct 2024 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA+x8+lk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B210F2
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729175796; cv=none; b=VjoSzjNQZQsgKYvFK0/PySvTMAsjBZ6D6nbcHs4B6VF1txy0daLGhMt6P0fY4WdY22Ke/q6aZkFiD7UC+ilm7SF2oE4Frp5WTk+82bb+ggmmxBuslcucI/KB2AZCcGejU7V3671Wdl4dK+Cup+rru49kRFXnISH91zlOLjMN30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729175796; c=relaxed/simple;
	bh=Ax+INfVbNJxR3C7JkO/tYlM2hVe3trTQltvhP8oUoW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6uMNBIzH9NNQR07FNh8UFZCbmauoc4Twbkm6pJjOr9GE37uETdYOJrTzb6kU7S1GyjFpw1cf5F1g2kmu4NL+WzSi1ayxoPtb6wkDNL3ewpaEK431ZZl3dtHCguTLvvfCPBPXoB5HvnTE7VsaFRksbyIXU5yRg0wJ2odFL0U8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA+x8+lk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC47C4CEC3;
	Thu, 17 Oct 2024 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729175796;
	bh=Ax+INfVbNJxR3C7JkO/tYlM2hVe3trTQltvhP8oUoW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JA+x8+lkUzEkhJwoPFhmKXlL5ZzcKYTLpivDDmI76l6fkdg4QIu6K472qgGwJoZAS
	 kqbvX/U4PjAAT5nCgBuOWl6Kv7qf9GeQqJyVI67HSgdStyOH1EHKxThfgJmzTLggFG
	 E4KpZh4if+F0OPCIbbOeto5WOWUw5sqy0C2LY2979JU0ju00TN00R1ZYxOaEEfjT3j
	 caW/HVsH94qnHwnpXH9OuCEk1yzEBv4KOKVxb6sb0mI4QZhuDj7vf9h6D54jt8p66G
	 3wg6IjzEraKSgag1o/0D+LVFCVe2hkqd/1qkxxPg404E2HRTSjLlabyO2WLPCv648R
	 JnFUJVCvFaesQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1RcJ-000000003t4-335O;
	Thu, 17 Oct 2024 16:36:44 +0200
Date: Thu, 17 Oct 2024 16:36:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Lars Melin <larsm17@gmail.com>
Cc: "Benjamin B. Frost" <benjamin@geanix.com>, sean@geanix.com,
	martin@geanix.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: support for Quectel EG916Q-GL
Message-ID: <ZxEg-_HH48-Jr6s-@hovoldconsulting.com>
References: <d4b02fcb-6476-4a67-bc07-e6a224891b20@gmail.com>
 <20240911085405.319899-1-benjamin@geanix.com>
 <8b356c79-3300-4fa8-a6e5-1556e2f6579e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b356c79-3300-4fa8-a6e5-1556e2f6579e@gmail.com>

On Wed, Sep 11, 2024 at 06:46:24PM +0700, Lars Melin wrote:
> On 2024-09-11 15:54, Benjamin B. Frost wrote:
> > Add Quectel EM916Q-GL with product ID 0x6007

> That was much better, now it is correct.
> Reviewed-by: Lars Melin <larsm17@gmail.com>

Thanks for reviewing, Lars.

> additional info
> MI_00 Quectel USB Diag Port
> MI_01 Quectel USB NMEA Port
> MI_02 Quectel USB AT Port
> MI_03 Quectel USB Modem Port
> MI_04 Quectel USB Net Port

Now applied with this interface info added to the commit message.

Johan

