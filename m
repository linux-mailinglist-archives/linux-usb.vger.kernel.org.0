Return-Path: <linux-usb+bounces-17803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBEE9D656D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 22:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552D12830FC
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 21:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03DC18733B;
	Fri, 22 Nov 2024 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schich.tel header.i=@schich.tel header.b="DV9bwM6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.cubyte.net (mail.cubyte.net [62.113.238.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5029249E5
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.113.238.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732311647; cv=none; b=GaRBWd/ehpV4siyujlpLwtmndYBo4+ouVkRwUlrVkGeP+dzuIkbFtvpIbayyHT8g9ZmtjV74qnPN9nV0yiDF7/Tuz02VynO+RBOAvaQvj0kIP3sn7HqE329cZpEkEsOaFh3ynjY6ds0gZ3nINijWrXo37tgv5lb2HYHl5/xKNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732311647; c=relaxed/simple;
	bh=IMp6bz/lVKR5AkGvIm4KtAunC0ezpZoPjaudAdNmeS4=;
	h=Message-ID:Subject:From:To:Date:Content-Type; b=rynqyj03Cdc1mXFzv+9QIGaUWv+uTogTYw9QPkreJxroX1hFKqJe7xtKhIHIQj6KMEILDCE7q3usRg86A5JLa4+2LzlHrWvPZ047P3rn38BXrRY+TtCc7ks0sJBlo2LD58RbGUKetMwrl7kEFQtBbACZB2mtq56TyGK9buxOil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schich.tel; spf=pass smtp.mailfrom=schich.tel; dkim=pass (2048-bit key) header.d=schich.tel header.i=@schich.tel header.b=DV9bwM6D; arc=none smtp.client-ip=62.113.238.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schich.tel
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schich.tel
Message-ID: <3028b8ac9bff9621a88995ecd768ff75128f6f0d.camel@schich.tel>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schich.tel; s=mail;
	t=1732311098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IMp6bz/lVKR5AkGvIm4KtAunC0ezpZoPjaudAdNmeS4=;
	b=DV9bwM6DtsbSLtgZGAuKvn4dKmENqkMo29d0jOvGMDRjZKxHz6YQHOY6ZjxyB1I5dmJ+Qm
	vldxmU58wug77iBqnwTKoqMih7ksZtEYIB/5VDVXumnV1GqfBKFqfN0zHbFSLCV03rVlMB
	+nI3djZuxoK85Z1jxUON56t8LTspnB9iVIJYS8XunJUjtTeaJACNMi6BwWHL/hCwvBVQOb
	dy76x+1K9VLoisFlOdueKz2uljMAghE4BEoG2QmCPJ5vTBiEw+VBWVb9bFcXtoNRqpNqAd
	KHN6pDkfWVbqYFVCj1RrVAewc/Aj2oIq9yEf1JJ+yRy+AXjOiAji6Ljsa2IuKw==
Subject: DP 1.2 Display with MST not detect on Barlow Ridge Hub 80G 2023
From: Phillip Schichtel <phillip@schich.tel>
To: linux-usb@vger.kernel.org
Date: Fri, 22 Nov 2024 22:31:38 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Hi everyone!

My laptop is not detecting 2 out of 3 monitors when connected through
my thunderbolt 5 dock. The screens work fine when I connect them
directly to the laptop. The screens also work fine when I connected
them to an older thunderbolt 4 dock from HP (don't know the exact
model).

My assumption is that graphics and display drivers work fine and that
the issue is related the thunderbolt 5 dock I'm using.

When booting a Windows 10 installation everything works fine as well.

Hardware Configuration:
Dock: Kensington SD5000T5 EQ Thunderbolt=E2=84=A2 5
Laptop: Lenovo ThinkPad X1 Carbon Gen 12 (CPU: Core=E2=84=A2 Ultra 7 155U)
Monitor 1: Dell U2515H (1440p) (Connected via DP 1.1 to Monitor 3's MST
output)
Monitor 2: LG 27GL850 (1440p) (Connected via HDMI to Dock)
Monitor 3: Dell U2515H (1440p) (Connected via DP 1.2 to Dock)

Software Configuration:
Archlinux
Linux 6.12

I'm sorry if this is not the right place for such reports!

~ Phillip Schichtel




