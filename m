Return-Path: <linux-usb+bounces-7105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6BB868410
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 23:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01831C24B01
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 22:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A2B13541B;
	Mon, 26 Feb 2024 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rueVVVg6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB41E878
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708988099; cv=none; b=m6hZbuoaYW+AXMkM+eQM8nsEBSHCGz9IGs+2UDAUgYCiNM8oHI+lKzq19C2xLXEegfDNWjQPbVbXd9b9LV6qSKVuW468PN5CXeH7cSV4L4FD6ZCiUSuwvXfV/N0d70jmU058Opu7VtODPZ/srt20BG1NmgxlxXGHvhG2ziFlrZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708988099; c=relaxed/simple;
	bh=FLSZZjbkGuZQBSsMMZaQvxQbUuaXEZrEG5l7P7dG3BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRiVW21g7W0U2/zn3E6OfhRCeDXOzVlC0re+8Gk8LDVrM+5BOCe0CKmRe4bNrXe26ahFLa+EtzfAcUiHscF/4hqnIhcJHGfIpVqyRyk89FC0LVwlNMNar7HMrkEyfzYkMZhmY6WopVAXJC/mIHtPDqtBY6wkMC5rewqr7hh2pAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rueVVVg6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so1329a12.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 14:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708988096; x=1709592896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLSZZjbkGuZQBSsMMZaQvxQbUuaXEZrEG5l7P7dG3BI=;
        b=rueVVVg6lp1Yr4riIyoIksc7/MyUo5Udo1vq1RwuqgLBw+lIrldJUcXay8c57DgEYE
         4QjIT4xkv7+xEXKr+Dik0VK9UaX+GY/YANT4nkDcSP+cKzsSEc1QaLrWjxv6UxKu4X78
         ct5Zwaxa8sB6ig/GjKiERKfl5lfBwJgt7WO+Sn5rwnHMLZHLmqwZFEKmcgOPdmIVtD0s
         261WkQ1ySp5QRxYflJDjrsYFxxhX+3fteMrLK+skhD+5FAuAqMFQLcT0YOl+UbGbk/8s
         9FTQNTTZEQLK9J8oYetFoSLcNMGfXzrfRYtrh5KXbdGe0yjAiatUtRc7P/xZqcc/+XWh
         cTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708988096; x=1709592896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLSZZjbkGuZQBSsMMZaQvxQbUuaXEZrEG5l7P7dG3BI=;
        b=wrAgh5VjpsXpZWGEy1htlgrF9JZngZH3q85S4lLQvF4OjA+yzxhOF04R3yrAI/2pua
         xG371/8Ua2uc1TF48niXTXsl86Z1XDpPrI9H/irJKo4Y1K3PCn4rP+b3jI6iVQXBYhoh
         8PO+1XzVkgh2vnAr+YJExtkeTln3sI/FB2mtNIbSL+ZNk+XIWeX0Tgo+DcoLfRXj9Gcb
         5K5U1XUNvHiSrzAQblTWK3UnfyUCbxfIfdEstzZrJF4AOHtjHmFIBGABeZcyJk+K09OB
         xii/7peciv2rH7MLhaNoWElVPdap/yalIJJnKJAzUDCDQYVcBNA7s3apFNTlECsT5E7U
         GUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3PN6nDfiCdKTAAZeBC/HZxPAMZuiFks/U9Wj9ZFjPvewRzU1NIaWQ+v70c7nINKlk6W89hxQ7C53jE8KgF5549moiRFydMBk4
X-Gm-Message-State: AOJu0Yx12hFn7LpBgw5XjMxYdqgE0ObjBALW+szQteDVUr3osvdZN//d
	/A0j8737pkIaHBeYV527jRuRJVTS/ixBLwc6o+Hd9OCqCbbEC74UgqqxtJMvE1E2QMXMIS5jxVl
	p5nfPRbG+dJJwP2GX9gXPytR3QXXHw4YD6O1/
X-Google-Smtp-Source: AGHT+IEDOdD2MyZImHPrYnLlKb32uiG7iw7que1fU5mfH0fvfu0KAsR82VAtNIZK45GpF+CCh54vfsOk2VkPyUjXo0M=
X-Received: by 2002:a50:9e2a:0:b0:565:ad42:b97d with SMTP id
 z39-20020a509e2a000000b00565ad42b97dmr100252ede.0.1708988095639; Mon, 26 Feb
 2024 14:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130192638.3557409-2-rdbabiera@google.com> <2024013021-fetal-nifty-38d4@gregkh>
In-Reply-To: <2024013021-fetal-nifty-38d4@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 26 Feb 2024 14:54:44 -0800
Message-ID: <CALzBnUEkyaJ=KP4L-yiAizsF7DnkOeWD9=PxWiKcLD00C_F84w@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: add null pointer
 check for sysfs nodes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay,

On Tue, Jan 30, 2024 at 3:08=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Why not populate the sysfs nodes after the assigment happens? That's
> the normal way to do this, otherwise your change looks odd because:

That works a lot better. I must've psyched myself out of touching the
current probe sequence and ended up overcomplicating it, sorry about that.

Thanks for the guidance,
RD

