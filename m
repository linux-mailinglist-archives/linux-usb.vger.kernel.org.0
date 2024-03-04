Return-Path: <linux-usb+bounces-7452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9C86FBEA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 09:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F951C21B58
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6F3175AB;
	Mon,  4 Mar 2024 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crafticoz.com header.i=@crafticoz.com header.b="Fs3qL46+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.crafticoz.com (mail.crafticoz.com [217.61.16.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA917571
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.61.16.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709541097; cv=none; b=mCNFqOrcgZ8mCx08BEGPOwus32vqdYuUxX69A29iJm1Thooc1dEVGnY6IAzkY3RI28Kh04wmHmqOr3gjJnM03Sy/uMX07YDSlJDmLKrSRLcf4HrSi7CMWhsBC+1yUvS0WK4WSXfvJQC4HjMVg0zYqUv8wcA5Kqrf0ECCzP9G0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709541097; c=relaxed/simple;
	bh=1IoqoUjByUuGlvKIsPqzKB660hvTAuw0hON+G/wNfyM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=HMMonJ1xY9PcI+f5aYrEIYnuW7bZ2bAfwOYj4Y1E0M1uztbWMo4YJXQu8lnyDZR8cvIbk3hYN45oxwn/WGeAWpM+JwIjig6qft5gIuenBNn5ZKoYfX30cOTzY+ldj/aaSRlyzrhPi3brzO8GGuk6rOkp8LHPjPgTHOvhBnj7edQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crafticoz.com; spf=pass smtp.mailfrom=crafticoz.com; dkim=pass (2048-bit key) header.d=crafticoz.com header.i=@crafticoz.com header.b=Fs3qL46+; arc=none smtp.client-ip=217.61.16.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crafticoz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crafticoz.com
Received: by mail.crafticoz.com (Postfix, from userid 1002)
	id 3087C82537; Mon,  4 Mar 2024 09:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crafticoz.com;
	s=mail; t=1709541086;
	bh=1IoqoUjByUuGlvKIsPqzKB660hvTAuw0hON+G/wNfyM=;
	h=Date:From:To:Subject:From;
	b=Fs3qL46+aiRtOhWSNp3wLcHwijJGqWcWJ6taci7LUxn4H3HJ1jjnga/jTcwxp6K0U
	 u8/02IB7ZEiVb2AdkhFCTIxzKl4FHUFGRgib79hNtZgIXcDW1wV2BWSOgfKYsuhpl5
	 3fr3QGqXFRQIeRuNr88/L2vH1XyHTmNrp6eOXR4BSOKEAUKQFEE1sQnc2X21QZQWy5
	 y8dEVmi6FSzHpxMyKLGlDUnNm4e93LTlH8vilbBkaAMHJdg1E8OpMiFu4ImodM+inX
	 5y9YcK6TwbekNGfiyXYy9UOPKCsfhuPl4Qb5qgu5fWz4dTnpY5MsAuaWseKaONMVgm
	 YpLPpZ8MoyDAg==
Received: by mail.crafticoz.com for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 08:31:10 GMT
Message-ID: <20240304084500-0.1.18.3i79.0.denxcrsiy9@crafticoz.com>
Date: Mon,  4 Mar 2024 08:31:10 GMT
From: "Maxwell Atlee" <maxwell.atlee@crafticoz.com>
To: <linux-usb@vger.kernel.org>
Subject: Development of new flavors
X-Mailer: mail.crafticoz.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Are you interested in expanding your offer with innovative food products?

We offer freeze-dried fruits and vegetables in various fractions and orga=
nic and conventional versions. We mix and pack our products, delivering r=
eady-made mixtures for direct use in production.

They can be added to various food products, from breakfast cereals to ice=
 cream, which gives a wide scope for experimenting and introducing new fl=
avors and a completely new range. We provide support in developing the co=
ncept and turning it into a real product.

I will be happy to provide you with details and provide samples for you t=
o test. We can talk?


Best regards
Maxwell Atlee

