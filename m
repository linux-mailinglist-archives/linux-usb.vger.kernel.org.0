Return-Path: <linux-usb+bounces-24812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D7ADBC98
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 00:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99E01892F29
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 22:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424F122171D;
	Mon, 16 Jun 2025 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvkNoO4p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8219F42D;
	Mon, 16 Jun 2025 22:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111422; cv=none; b=J2kz3vtUE+b/4etyrazjQ9qVTqdC0KkmbRlXrKEd0LMT6NOBItPa9NenGUy3MpEHLZWNgsgXUibZDkk2GHIWs5Gr6QMaitnMLh4z31MDutkzr9ArkFCRJOQb4Rl1BlcdsXJTBl4lZ47HHNJgE0BhT8/djE+6/OWqmUvYH+jQFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111422; c=relaxed/simple;
	bh=Z6/duheEeCFwL2NXRIUsKLixBZr7mWz2PMhsYW2GBg0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opIo1CGZKj4cqOdkSNDzJMfdyPNtiUMITtrHjIRp5O1m1S5RJ4mgmO6prj2VP0J5jT5Ajg2s60jkwHtyl7sN53t8ujW4d8KZBBvTmz4zm88aTY+GALtTktw7cwP7+KJoBRk/pwaXJEr8yJBhrrJVJK48W4j/BC846fDIHAW6e7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvkNoO4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13ED5C4CEEA;
	Mon, 16 Jun 2025 22:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750111422;
	bh=Z6/duheEeCFwL2NXRIUsKLixBZr7mWz2PMhsYW2GBg0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IvkNoO4pRGtRxH6KTEf27fRRqGL6IRUsCy8ccvbV07yyTqnV3l3S0n4HGgWrJvtsQ
	 z9xvSND8PLdCcrbBd1g/giJDafCDGqx5jR7m686WqfWSQSUFBLT+F9k6wHVMZ/ikko
	 v/VrjOt4G1KMpV79BtXn6WDyCasyc3KLEXpCHDWSwRmdYgQwRzlX/ZSnoI+Ggv9hdo
	 16rfM5teimC6spXpt+pgtdHWh7h/S4MPGJC/utszMpLWgD0mbmjRUnQC8ZKYs1Xphf
	 otmpg041HIqUjjTiPPU3Enqsg2rgHMCY4NJ3XfEi3BQRPVnLn0dAFLZvaZ5BkmUNaJ
	 aHOOyyzubpEew==
Date: Mon, 16 Jun 2025 15:03:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: dataonline <dataonline@foxmail.com>
Cc: =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] net: usb: qmi_wwan: add SIMCom 8230C composition
Message-ID: <20250616150341.3a310397@kernel.org>
In-Reply-To: <tencent_0F1668EB507D97CB15755AB59FA378B1C408@qq.com>
References: <tencent_0F1668EB507D97CB15755AB59FA378B1C408@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 14:34:27 +0800 dataonline wrote:
> Signed-off-by: dataonline <dataonline@foxmail.com>

We need something you'd use as your legal/government name in the commit
Author and Signed-off-by fields.
-- 
pw-bot: cr

