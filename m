Return-Path: <linux-usb+bounces-31886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8DCF02EF
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 17:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 827FA30142D0
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 16:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341FE2BF012;
	Sat,  3 Jan 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jGTc3p4+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721A2E65D
	for <linux-usb@vger.kernel.org>; Sat,  3 Jan 2026 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767459160; cv=none; b=QU9jMXFhVhMl9F44yX7+VPXDcQ1Ewgn2GrLGzGtTAWhSNA1wG1B6eO07LmtlitoYlq5X97NyfJCN3h+ZPoeQe62A4yF7Ao0jnVIx3GAYYXAWXNTMtZnJEk6vFAIrBSGBa5BcVLeNWdXesMlD7rq5aKFW8HpxBtGUPw+sH5JZgcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767459160; c=relaxed/simple;
	bh=H60UYXxSQidbFBN9xb3ejM/CgZenz0pXMflcbLSaDn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szn2H/Vuqz/KWIVO5OsM5KGaO9g57wlXGrVlJeK1NiZ+cYGMwz3SNdVG9tNxDKG0UpnnEnwfChtr5RGwJmGH+hN320WnP4xEJABUC8PPkKS4IJPU8Co1wzVffoBcHQqE0G/2qvf1pqpFlyqPZOR/7eT1YujaXWrDlhU2zuF9WVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jGTc3p4+; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2ec756de0so1376569785a.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jan 2026 08:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767459158; x=1768063958; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5MBRZKMi6bXOFJwQ+FrYSJRg6IG5AM9H9ErrTiVuVo=;
        b=jGTc3p4+cNlBc2Rn7xinJSGI4Nxgkf/M0ogOvG7BvPmK2SrtZBElMrqVZ6vs42Oy1P
         qnu1G9g70uGdFfjBix11rcRDNaxGHSMgmZCSwkrUpAPLLmT0CBJPKLUdoEBNWA/BPPMY
         oCsej2GLmXomVXqKFhGLnsrXD9b+e+z6Giv6pRb2TL+LAq19DjPLTjtaRicJHCHOSGJ9
         plH9LeyttSGqpjw98IifPEIJ88U/Ka1oxCkS8khqOb+aA7QzjGj4ePHZrPgW5qUHrwA5
         fl2UDRwB1YvxIdH9gKTFnXt3BKmW7ic2TAx7c3VRo21zhIlaT0vXbiHegWBTJfsEBYp6
         tqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767459158; x=1768063958;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5MBRZKMi6bXOFJwQ+FrYSJRg6IG5AM9H9ErrTiVuVo=;
        b=fh9NqLkiK0FHuH8Wgug0MgcVAuW9QJk+TvCB7wB471df60gnxvVYqCrBem68hbBIhs
         rWqgcUiT2xd7CAreCwsZhYqD01Jv0Y4FP35ZdODz1IDKg+S4tMu8dmM3uquVlFDsFi+z
         AFihGPa9L0goC4cyAO9ugjNljNaugVIx2zjBWv+d2RBYit4s8EPl36x6jLc0atwVSryW
         /7uQwqdvZC+zAzhVXzqybDg3ucQeNVpwBAwECbR8OwDJJno7esGbVMICkVZItEDyrsgL
         p8yvyMDOcxy7sAaLjDtoDtyDYJoDpo7IM87WH7divZtR2ppqto57GMq0ddgsYYf3LcVJ
         Fd/A==
X-Gm-Message-State: AOJu0Yzhfwb0+I2qpueTKu3xQ19JdBjBqfZOmGOnSyImXUEN9eOjSj+Q
	CDYPX/LqVBcfP1C9ANRzGKEWh1PeAOVOi0J9kiZp7kCD8mCRBLFvcXq/DwZD/a2GfsQA7Z2/8LT
	FRnA=
X-Gm-Gg: AY/fxX7OxgLAbWIhAITWW47ibXRn0SVs/kRv/cWnsX2wtKcAddJVvkLhkXgnS0dwyYA
	xDnmmqbNv4Q4GfTjVPkkJzMz+KLEqpbv4+zw4lNCF8NxCQ2KTXQxWM3xiCuYotyqRWFuxnE7VFp
	G63TPqhRBABSIf0iswZJwlJJf75j0o6QYosxpvoMiy5QE2YxnfYilB5gNsUaw1Xu0dqtCqFlEUI
	4mOmKY3vOpOD89rNbFl79VsGxzYIBsblQ6h79TSeBJMH9rub4TpfhCljQZS5yfOJr0KS3SDVqFq
	prNCS89ZZEVzoj6ZdmLKX19uCH8m2KXbU4KrzKypuTS1P/AnEQ/RHeuEP+C9Z1XGtcMzcrl24yf
	OOGDaOIEXOuQN9COUJyQb4vu9VWBJHFjozl8Yzup9evw+Uanfpxu+a7U8DYyx12ZIQLWr98PAPw
	rIyf+U5juhIPAb
X-Google-Smtp-Source: AGHT+IEdOeMnLuDo5wk6JxgkQ5m/xxoPNXUEmkORfojKinqnTeP8vItzlz0nLoFphUX28QZJodKUpg==
X-Received: by 2002:a05:620a:46ac:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8c08fa99992mr5943185985a.54.1767459157956;
        Sat, 03 Jan 2026 08:52:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::16e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm3387280885a.50.2026.01.03.08.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 08:52:37 -0800 (PST)
Date: Sat, 3 Jan 2026 11:52:35 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[Changed the Subject: line and started a new email thread]

On Sat, Jan 03, 2026 at 12:00:13PM +0100, Diederik de Haas wrote:
> Hi Alan,
> 
> On Wed Dec 31, 2025 at 7:09 PM CET, Alan Stern wrote:
> > I can't say anything specific about your systems without a lot more 
> > information.  However, I suspect that any problems you are running into 
> > are not related to that warning.
> 
> What kind of information do you need? I have quite a few schematics and
> TRMs (which are also publicly available). Also happy to run various
> tests if that helps. I just need to know which.

We can start with the output from "lsusb -t" as well as the dmesg log 
from a boot in which something (a USB-2 port, for example) didn't work.  
If the log shows something going wrong when you plugged in a device 
after boot, explain what you did, what happened, and what was wrong.

For now, concentrate on just a single system.  It will be much too 
confusing to try handling all this material one seven different 
computers, all at once.

Alan Stern

PS: Always use Reply-to-All so that your messages get sent to the 
mailing list as well as to me.

