Return-Path: <linux-usb+bounces-19475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B602A14AB3
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 09:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A33E7A3D66
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 08:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C826C1F8695;
	Fri, 17 Jan 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFQjFg9k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492801F6690;
	Fri, 17 Jan 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101436; cv=none; b=G0u+Wy/DDWSHPt/9tEloxMqha00/trH4kNjFExQ0+8cJ3Jgl02Hn3DD1uiqhpA8JOdZLl9SAocAZ/svXVaQv3q7LLwvMp+sR/tfe53CmH0NhSVVUhQf8GlYsgJ702Paa6COcQ2DRkrNeQke72FHSq/VwsOy0B1rgMAYQplNX6Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101436; c=relaxed/simple;
	bh=opRK7NgH+7MrLAvVJZk5UbngvDrYcIw290A0pU+/F5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKuGmG6MQZiP2COyJpf0foMeOgdYB5XZ1qNnDzAseAaCIP3nRgaosSToP3nceJQlVnbZV3SN6iOz67KDZmdUKXeNKE6MtJWuEvErzKZfZbOUf4Y2HceJpkqIiip9LapmRjbw4q2ej2TT5Y7xNoIgezrdLFyMIwKVWYzKk1b3nv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFQjFg9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2024C4CEDD;
	Fri, 17 Jan 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737101435;
	bh=opRK7NgH+7MrLAvVJZk5UbngvDrYcIw290A0pU+/F5E=;
	h=Date:From:To:Cc:Subject:From;
	b=pFQjFg9k8QIKL8hjronCcPWOSfBvtZ6aiNYnHaYafoI2UnFHSeGpHVgn0NQQjLiA7
	 KtzhYJ/6lFp4wl77CMlYbjThiyZTTxOEMtPNn/diXPAlyUHJYjxXLGxJ75i/aSTyoT
	 1UDaiYQ7Imu7SfToCn/Wqi2wa9YhLJBwNhqMYrI9noFD1DO62PNRVPJjPCKwam/Nav
	 awQ7bKg0VbfzC1gXhz189PFOggExamaz8tRqtQJV7++yuh92o1n1+v1EsnrGNsQC7m
	 dhmigS1zahxATS5ORgfyuLwGmorWds+a6aaE/QNLWWgTqZcEFjh/JodMEHQ7U5Auqi
	 b/N58O4nWr0TA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tYhRB-0000000084j-0weL;
	Fri, 17 Jan 2025 09:10:41 +0100
Date: Fri, 17 Jan 2025 09:10:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 6.14-rc1
Message-ID: <Z4oQgYrBReMU7foh@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.14-rc1

for you to fetch changes up to 575a5adf48b06a2980c9eeffedf699ed5534fade:

  USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb() (2025-01-14 10:32:38 +0100)

----------------------------------------------------------------
USB-serial updates for 6.14-rc1

Here are the USB-serial updates for 6.14-rc1, including:

 - fix a long-standing NULL-deref issue in quatech2
 - add support for hardware flow control to ch341

Included is also a related clean up.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Johan Hovold (1):
      USB: serial: ch341: use fix-width types consistently

Lode Willems (1):
      USB: serial: ch341: add hardware flow control RTS/CTS

Qasim Ijaz (1):
      USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()

 drivers/usb/serial/ch341.c    | 35 +++++++++++++++++++++++++++++++----
 drivers/usb/serial/quatech2.c |  2 +-
 2 files changed, 32 insertions(+), 5 deletions(-)

