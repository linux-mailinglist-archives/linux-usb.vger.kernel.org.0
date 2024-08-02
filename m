Return-Path: <linux-usb+bounces-12889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D4945EF1
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 15:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864B71F21B12
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 13:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4902E1E4852;
	Fri,  2 Aug 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B21CuU64"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0F1C2322;
	Fri,  2 Aug 2024 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722607025; cv=none; b=qacpfECmLaq1zYTv+LLR9jS1CKLRF8lOyELCbhyVs8mtK9pIs2+Y/OueEF7TsBuTrVaLcdMHrIe8zJUwsZf+XLxx30St3ASs1xhWQana35PR9lHwgo/dq+C4wJF6GhiQM/VJ/vbaxqTVyioq88PTqqGvT7V6arhm45CevCepDv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722607025; c=relaxed/simple;
	bh=M9OVsY3GJ5QgUhGysZAznYAbwjYUR0PByg4lMxb/oiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EH0TBwPwPnMAyrl1YpZpjFCQWOctEeTghkXOtQ2grfmHjgx2TPvWHi+hLZNqSZiSiwgwvfIXWzVXjsy7xOwGzgkDKJf9umEGPlId9G0Xmi/e5fHC1XJ5gEXDoIqG4rCsRt9KOiUJpZ2EcCl/82k1GYle5caFxydZhUwdVkXR9AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B21CuU64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FAAC32782;
	Fri,  2 Aug 2024 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722607025;
	bh=M9OVsY3GJ5QgUhGysZAznYAbwjYUR0PByg4lMxb/oiE=;
	h=Date:From:To:Cc:Subject:From;
	b=B21CuU64YdqjQeGa7VPV0A7Ig+ZpwUsWIKi4kMSa4JMD0KQ3cWg/w9NU/qc4KHka/
	 wLJBsQXSE9WuDOOsZieiN4rR13GxRyjCFAanpj1ZGm9f2EtjKP2NOQQ81ZwWa2XtFP
	 tz4oq5WtzLvOX8k5chtrtRyrJ+4+rql0GphAJUGjwD1Tv4zNnQUASXHjdk6PAF8b1u
	 CtCz/eE4Kss37KD/bYD93P4p3vHsLs36Xt/hUSyrO3KPwiFw9OVUr2WMSTxRoEuo+y
	 1xezHN5VAGlEPASXpJpnGfWU8TAErfJIg8mb6AUbjUXei+OpxA8OkF+uHCSHNYSe2g
	 NTBuugz07861w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sZsmB-000000002tf-48XJ;
	Fri, 02 Aug 2024 15:57:00 +0200
Date: Fri, 2 Aug 2024 15:56:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial fix for 6.11-rc2
Message-ID: <Zqzlq_8Cg8KnUwL_@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.11-rc2

for you to fetch changes up to 00af4f3dda1461ec90d892edc10bec6d3c50c554:

  USB: serial: debug: do not echo input by default (2024-07-31 15:13:45 +0200)

----------------------------------------------------------------
USB-serial fix for 6.11-rc2

Here's a fix for an issue when using the usb_debug driver with Xen.

This change has been in linux-next for a couple of days with no reported
issues.

----------------------------------------------------------------
Marek Marczykowski-Górecki (1):
      USB: serial: debug: do not echo input by default

 drivers/usb/serial/usb_debug.c | 7 +++++++
 1 file changed, 7 insertions(+)

