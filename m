Return-Path: <linux-usb+bounces-15370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F958984C3A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 22:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBBB2B21E06
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 20:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17E313B58F;
	Tue, 24 Sep 2024 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v3o1WH8a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061C1386C6
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727210179; cv=none; b=VvvH9mxxwszsG5AEHIGpHalFB2ehjwvpxKZa+mlKYHbceFO+4H0GY3v1FnCjgUGPDwvLYr0UzOALR5BNfBUW/SZ7djFw4mHMjp1LvN7D3JXmN0BG0sMs6KkRHSdBIVYykNdFfaxPF0feV5Wn6ran6vGtbpA5E+vmuGEKpdHrXdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727210179; c=relaxed/simple;
	bh=4XOfJYlBmK5qbMkk1t2ESZ0yftbr5OCNN84SA30CPX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2KrJtOX1shKrD7hLo8LfwAfe6nGhiCuxTQd3mJjDY87PqHATf3xaa+TC1os95lGFmAilySjUq2i4o0XGjq+m5O40PR2LUXvbf1zflw5vV1Kp+LnHOPE0cB9Qgxze3tn4lOsOjzh2h5cE66yhN1z20+qTjz9EKpNj5YgxhW3ROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v3o1WH8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBC7C4CEC4;
	Tue, 24 Sep 2024 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727210179;
	bh=4XOfJYlBmK5qbMkk1t2ESZ0yftbr5OCNN84SA30CPX0=;
	h=Date:From:To:Cc:Subject:From;
	b=v3o1WH8akuT4DkZdh5mTRYKLp0MxunGaxAYLh6WB9fsvDbbJUWz0AjCqM7QxPsX6Y
	 BAeEkc8vywz4EC0R0SbZa81gz/YG5ue1Jq5WfrNM4tW4/s+LYk9HcbRAs/nG7XmYwS
	 T3NMFWSqPs+RUJrqjrUppAe/TpKNpi6Y4CCvHEQ0=
Date: Tue, 24 Sep 2024 16:36:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Binghui Wang <wangbinghui@hisilicon.com>
Cc: linux-usb@vger.kernel.org, helpdesk@kernel.org
Subject: Bouncing maintainer: Yu Chen
Message-ID: <20240924-meaty-tangerine-guillemot-b8edca@lemur>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I'm reaching out to co-maintainers of the following subsystems:

  - USB IP DRIVER FOR HISILICON KIRIN 960

The email address for one of your maintainers is bouncing:

  M: Yu Chen <chenyu56@huawei.com>

There are several possible courses of action:

1. If you know the new email address for the maintainer, please ask them to
   submit a patch for MAINTAINERS and .mailmap files.

2. If this maintainer stepped away from their duties, or if co-maintainers are
   equally unable to reach them via any other means, please submit a patch to
   MAINTAINERS to remove their M: entry.

The goal is to have no bouncing M: entries in the maintainers file, so please
follow up as soon as you have decided on the correct course of action.

Best regards,
--
Konstantin Ryabitsev
Linux Foundation

bugspray track

