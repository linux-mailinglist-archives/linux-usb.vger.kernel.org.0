Return-Path: <linux-usb+bounces-22625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28FA7DB9C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 12:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F98188A85C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 10:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D5223908B;
	Mon,  7 Apr 2025 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="aaapZUht"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B22376E4
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023399; cv=none; b=qc2VwhJ4S8ZuNgiM2ikcVNR3KW3HErPYAmavcUBFfZX34tASUCsqXKmoD504g/JbE5GyppwRcstUqf9dqHRqZ53w7Aw1ODbAiUh/f+TYfJY0MMW//+ivb7AYF+EDKSefUTYMFOu8asNSwalPrcZww4Tv4mtQYdFRI5yIhdOrr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023399; c=relaxed/simple;
	bh=ad3PDh/4CBYX4YIw9XSYaYN+zGi062AKgi3/Oe3j5Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCsSVv0WIgGQmIkqm7F4BkeazhA3WFWwc/IE/B17lIj2PFIBxqZdde0Od7JuZ6taehpyWvAiW+CaFQwP5o96oWW5/PFxpaYVjhKc/zzOz0acMJD7JZ2ybyBZKT/zAvzS6pLvJB10bsuM59aQo7RfqDKlkHwhMCC7XpzMHpdF01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=aaapZUht; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B34BA240029
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 12:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744023389; bh=ad3PDh/4CBYX4YIw9XSYaYN+zGi062AKgi3/Oe3j5Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=aaapZUhtosjr/SGvQGdPfT8kW5PgTKl5Z3rP/VbxXMZAu7i1D+L8JFL2Dx62vxLt8
	 i+NkcqrwWeyZHWBC09i1aum7b4HXPmyz/TT/HnWR7elxytlMVaL0g58vcPRAesP6fR
	 yj41Q4y3M5ofg59KcA5ESZ4MCmsJVsOO0MaO58U3ka3GWOF3EMWm89AaZNqLlnbtnW
	 BvyKKOw6H3yi/YZ2fv8Gfb3nVD0fZXIvecdNsF9SFwDcTjm+iinq4ZZO4FCw05/Ln5
	 4uIJL3cyNG5fNobqbU62H0B5YUCWsXOnAhFmids+xqvmRIGoJQ7ZX08piZu/8a1Rvv
	 5+aPHJzoBHGhg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZWR3H6glDz9rxN;
	Mon,  7 Apr 2025 12:56:27 +0200 (CEST)
Date: Mon,  7 Apr 2025 10:56:27 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: j.ne@posteo.net, Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] Onboard USB device support for RTL8188 2.4GHz USB
 WiFi module
Message-ID: <Z_OvWwunajTcg9TJ@probook>
References: <20250403-rtl-onboard-v1-0-10ca9a6a4ee0@posteo.net>
 <14513d89-1ee3-4d90-bd26-1d761714a8a9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14513d89-1ee3-4d90-bd26-1d761714a8a9@gmail.com>

On Mon, Apr 07, 2025 at 01:37:17AM +0300, Bitterblue Smith wrote:
> On 03/04/2025 17:07, J. Neuschäfer via B4 Relay wrote:
> > This patchset adds rtl8188 (usbbda,179) to the onboard_usb_dev driver.
> 
> RTL8188 could mean at least five different chips (C, E, F, G).
> Should you use a more specific name like RTL8188EU?

Yes, that's a good point.

I'm not completely sure which name to pick, though:

 - The chip is marked RTL8188ETV (see photo[1])
 - The RTL8XXXU driver reports it as RTL8188EU


Best regards,
J. Neuschäfer


[1]: https://c3voc.de/gallery/misc/fernsehfee/92QVxQl.jpg.html

