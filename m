Return-Path: <linux-usb+bounces-29409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBABE8BDF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 15:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96938565118
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 13:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FF63469EC;
	Fri, 17 Oct 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="avJFAk4M"
X-Original-To: linux-usb@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E80343D6D
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706312; cv=none; b=AN/pe3vudKBEcLg5ijfU1nYAyELPD5oevQWSMcUbiP6QEmVoxXgwNXp0ekxpFAR/iSWuyuCa1h6+cFHXhRXC3b1FjVLtWY3kXE+u24QLdt6nHzLCKOXct2X/axi/Lm1veOaFjF+GHG7kED1u2Fvgoespk4nM+fULbhH+IS9VMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706312; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fSyjkSPDOkWw7eX06YuLxOVzYWrpoh7lQnAJAwHZ0xQlVaVDT3wYDTz/BkTtay23U0lHPwZsj7rAMj5cBdt6k7eP0tleeyKgCTiWb0O1Uu52RjLqQxwrRvLuYOVIB5FuW5NTk9rSH4anPGzkKVTw8ARac758B4UPp+9D6dwoj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=avJFAk4M reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 7869A527F0A1
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 07:45:35 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705136; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=avJFAk4MFBb2K9p0DF//8LvmupPeaaj1SmNnMJHqKZ/kTLZG8YUrcHjt9A8LeAW1hjTPrR
	DmKmJlZdVJuNlg/N+CWudpNX7UA+ZMKzAebhIQLJVDXxgM24oXuIpN9SNcF7/2ZDf5396G
	r4LqE/A7t2JmJDTloowom9WvwZRvwH1pJs0UBVthmpRHKQI0OfLSzeWCqqNI3xxuCHm2Rn
	prnp6hlHkB6JAlqzya5EwRrSr8bjZAFNE1Lrx8LDZ/a3pnZ6CurpIHlCcBanxxG6EM+CAU
	RGfd5V8W3s/5ESXfWSYhS5hMLKRY8u8DytNIEd0+f9Br3M7nUs9PZkFvzFheWw==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-usb@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:34 -0700
Message-ID: <20251017054534.F3EEC08795F3E2D2@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

