Return-Path: <linux-usb+bounces-19200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D662A09630
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 16:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD697A3A06
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 15:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CB3211A03;
	Fri, 10 Jan 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="USXoiDRm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5520E035
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523899; cv=none; b=dseM7We20vW8iEtqX8pQ+ZS7gD/zN0MIx8keI/Qe8qVlNuiMl6WmzeUBZUd2Pco+PvN5oU9fbyfo20jkbOni9sPxZy/PEUysedmzelO2MPfKeJwN6GLqq7rr0ZsvgsfsBlMtZlN4m8pLQFROfJpxqJG1KU2Cwt2xHHE5hC4vaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523899; c=relaxed/simple;
	bh=2YHd/xEIXsTeUXVN4rOdVMuCXbGDJ+OJX04WA75eC3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj6rYfQ7sXsCvBDF05ea/Ztmh7TdSIL2+U9ZalOWpWh7NuCD/wriUL9j6q//Mv++25Zfoj3C9JS468Jsw6idC9RQRtA/eDTbnVA8vab26MWjMIgreTY3znMZcUq4/XtuMasuvwF5Aj3deJH0iBphu3jLFTO1WUi3lBx5IKAwXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=USXoiDRm; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd1962a75bso16396126d6.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736523896; x=1737128696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MapozRkTPgyA0rzoSDPzN8c9CZKYG/kmmqSvGjXwZIQ=;
        b=USXoiDRmptalGBa7n528wpp7kR+qvYGu1qwHdHAuThRpZGFKbEpGZplyrTE1IQ783t
         4l7Y/Bd/UuVvPz6zoE7STbp3MXoMVmD+ZnxQH/CDn6AaOuJw01WBWeNSmMUmMQwgw4OG
         YEm1lWKRy0AaCcI0JUMe+V3wxEM/ITElHA6Kcctw3JlK3slGX9lnsTBz70FFL0vWRuQE
         R1o3sq34VqkmD7e0wmWiOBBZftJE9MqP/htu1DK9qv/ac2lZziNVqG88trRkTpplVo26
         z7R17dm99GIrQlgnMuu7PVeiX8WygYBWzS5Hf7jfUzw+TV3oQdWa2o+Yu8NRr7WT2y+U
         Ul7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523896; x=1737128696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MapozRkTPgyA0rzoSDPzN8c9CZKYG/kmmqSvGjXwZIQ=;
        b=HqVJ1x6giE3bxMpc1NXwu4c3FHGXvZMY0yO7yG1Atja8L2cwP/O+Lu5ZUhEiIQO55M
         gANEip1skiRLfkGYY8MDzp0mAHozcBy9gG0KrL9gV0aw62Eau0QUPvKW8ZTjWKt977sH
         6Rpuy2BXkB8iuJqsFizPGpxNKEWmqs0o32/H2F8KkA9W7jsuc25EBxuQBW48Uz1IYaub
         PIayMsB+YbTJqG9EQ2mi5216Ch1DCyP7Gz0vgwiEAAw3aF7XNMzOKZyZexc6PZgEFv8x
         fP4kARtRj6PBFpQzsEqbPSOuvDqyzuDkcgxwWQJw+qYT+MrAgpxHTP8g2Hl1QVgic0rA
         Iwyw==
X-Forwarded-Encrypted: i=1; AJvYcCXTDY2FYj4NduFP7RA31xO0lOWFmcEyPiWvlHZqQs6Wdjubs3IL3fYlqKYDcJGzWqfUjrIiaj5+Npc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhWdTlIURvIRuoUhvctMMMa1SUJODLyBEdJyY5fdHR96dmtOFF
	OIuYB7Kg5AzF89s0qqHy5sQCg8HH8io29MvVDd8K4VQCrJqSJpt8B3BcsK/ugg==
X-Gm-Gg: ASbGncv1tSrZ5Vixg2wO4kk0vf9Ii1x3T49qWCz3piGnVOiWTerKohqrvVBDmtdqThA
	ohif1QdwhA2s6neov/fNbz/xEi4x2+HRGgMFhk7m4XZ4uZ6vHj8juQLPuqx+BHgaz2MEYyMaCXS
	3KudAID6dxNqDwCZ7yrSaMXTjOKnRRPbAuQMnufkX2ik6HdXlCqe7Nr4FandIl94NQdUKTOiWNH
	C2PKoIAeyv5UTuDufPbwnmckedL9pvSZ+VA6f3YrClp8msDAYQ4CR3dkQ==
X-Google-Smtp-Source: AGHT+IF0RpZocJNE1ArqvKlBEjytgNfQVhmD91xG/c7hrqqcIVnudSSTZQaw6Jur8F228MQhz3Qpqg==
X-Received: by 2002:a05:6214:3c8f:b0:6cd:ec00:205e with SMTP id 6a1803df08f44-6df9b0eda40mr178930136d6.0.1736523896606;
        Fri, 10 Jan 2025 07:44:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::bde5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade73245sm10216446d6.76.2025.01.10.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:44:56 -0800 (PST)
Date: Fri, 10 Jan 2025 10:44:52 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, pavel@ucw.cz,
	len.brown@intel.com, bhelgaas@google.com, duanchenghao@kylinos.cn,
	dlemoal@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	hdegoede@redhat.com
Subject: Re: [PATCH] USB: Prevent xhci from resuming root hub during suspend
 entrance
Message-ID: <b16e2b38-e9f8-43af-9df0-0510895c02ee@rowland.harvard.edu>
References: <20250110084413.80981-1-leo.lin@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110084413.80981-1-leo.lin@canonical.com>

On Fri, Jan 10, 2025 at 04:44:10PM +0800, Yo-Jung (Leo) Lin wrote:
> The commit d9b4067aef50 ("USB: Fix the issue of task recovery failure
> caused by USB status when S4 wakes up") fixed an issue where if an USB
> port change happens during the entering steps of hibernation, xhci driver
> would attempt to resume the root hub, making the hibernation fail.
> 
> System-wide suspend may fail due to the same reason, but this hasn't been
> addressed yet. This has been found on HP ProOne 440[1], as well as on
> some newer Dell all-in-one models. When suspend fails due to this reason,
> the kernel would show the following messages:

I believe this problem was discussed on the mailing list before, and it 
turned out that the issue was caused by a bug in the xhci-hcd driver, 
not a bug in the USB core.

Basically, suspend is _supposed_ to fail if a wakeup event occurs while 
the suspend is in progress.  As I recall, the bug in xhci-hcd was that 
it treats some non-wakeup events as if they were wakeup events.

In particular, a port change on the root hub should be treated as a 
wakeup event if and only if the root hub is enabled for wakeup.  Does 
xhci-hcd check for this before failing the suspend?

This reasoning shows that your proposed fix is incorrect.

Alan Stern

