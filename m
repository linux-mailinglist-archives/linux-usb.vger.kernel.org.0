Return-Path: <linux-usb+bounces-27434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C49B3F6C1
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 09:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78B697A3FBB
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 07:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60D72E1EE3;
	Tue,  2 Sep 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=veemax.be header.i=@veemax.be header.b="LsxHgWK2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF372E6CD4
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798415; cv=none; b=WSNGt89LgRAt6QuKfRXYFOjgp5OWsU4ADbbmHWQqwgJRpzj3kzHzBROI7xzREc7Z1AoNfzgaepLN4Mqf5pn++BA4MylWnvSL/nnOgfoGekJJzsEbt7o87O69Tz+iV2LZch2uGvRdLi1Su4nUekQEw9oHMfRlg0mRjojUjmvDWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798415; c=relaxed/simple;
	bh=nqZMa89UTzOFiZ+zYh7eOvc56CONm2CdfeMNb2GNVC4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=Vfvkn3w8FFuQPCzpwUMPrK0CPgRAWBvLYRMh9wHSP7Z4nDpt8iOZwTj3W4jVb0yL5kXLzl1V2pZk2v3KnyFbpLyyDTdlakpbo5PIbDmfntxpUl8ju/p70UwytPri+T6d0u+mjKQtdCvtsyFvNnjKXkBn7bnR5oL0vO6HtHTk8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veemax.be; spf=pass smtp.mailfrom=veemax.be; dkim=pass (2048-bit key) header.d=veemax.be header.i=@veemax.be header.b=LsxHgWK2; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veemax.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=veemax.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veemax.be;
	s=protonmail3; t=1756798406; x=1757057606;
	bh=7FVVNyH/5wpbgeKuwUZqO8WwfX0CFx9tbq+T3gJYGXo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LsxHgWK23hJAE1x5Nd59Jc5f/N3hlgTKUfBgE/jMhgmcrZUUAV/eB8ZpHcqgRLx9i
	 j4dTfLCCf29pt8OGqB3dA3mAvzUqDCBWwZIyR9E/BkotFocnGOPl0jYtOK1WJYaJ0L
	 MHfRynfarccUtAHZE8/imeMApyhuawjcyNlbCigvLI9d4PsCXwwHLJ+P3qunL1VEkk
	 pu0WHm76pZP2VnW8CfzNxmWmHd7A9Yb7ZXZh0yME9YKY8XC6JNX/ALlMUwufeG7+ub
	 nNceNNNDv1eAm/XQSNBf39zijyByeoEmsQYZpq8nJvwb2BC20xnHko+uC9n8pnWfrq
	 awCBQJPAF98UQ==
Date: Tue, 02 Sep 2025 07:33:21 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Maxime Vincent <maxime@veemax.be>
Subject: [RFC] usb: gadget: proposal for Microsoft OS 2.0 descriptor support
Message-ID: <5aTfWPS8pWa0ctuEBVvtEEYLuw5fUBixSRpZG3klXdOHcLrPebGG3tZy4H6Y9tR895qh_pdPITpbH1R4Vws1QaWL26dRHmZUvqxBExpHEO4=@veemax.be>
Feedback-ID: 28070965:user:proton
X-Pm-Message-ID: 2cb5929eebcc1fe9e0ac27aa5d7d05f8f90a6951
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

This is a request for comments, not a patchset.

The Linux USB gadget framework already supports Microsoft OS 1.0
descriptors in usb_composite, which makes it possible for Windows
hosts to bind WinUSB or other class drivers without requiring a custom
.inf file. This has been very useful for devices that want to provide
driverless support on Windows.

Recent versions of Windows (8.1 and later) extend this mechanism with
the "Microsoft OS 2.0 descriptor set." This supersedes OS 1.0 and
provides:

  - A more structured way to declare WinUSB interface bindings
  - Registry property descriptors (string values, device properties)
  - Support across multiple configurations and interfaces
  - Forward compatibility for future extensions

At the moment, Linux gadget drivers cannot expose these descriptors
generically. Developers either hardcode them in out-of-tree patches or
skip MS OS 2.0 support entirely, limiting interoperability with modern
Windows hosts.

I would like to propose adding *generic* MS OS 2.0 descriptor support
to the gadget framework, in a way analogous to the existing OS 1.0
support - and similar to how WebUSB support has been implemented:

  - New configfs attributes to define the OS 2.0 descriptor set
  - Helpers in usb_composite for handling the vendor-specific requests
  - Backward compatibility with existing OS 1.0 support

Before submitting any code, I wanted to ask maintainers:

  - Is this considered broadly useful enough to merge upstream?
  - Is it okay to support this fully through configfs?

I currently have a PoC running, but it's nowhere near ready to submit.
Feedback would be greatly appreciated before starting work on an
proper implementation.=20

Thanks,
Maxime Vincent


