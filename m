Return-Path: <linux-usb+bounces-4156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B142812E82
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA82A281CD4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 11:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485D53FB2D;
	Thu, 14 Dec 2023 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiogNnaX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6583113
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 03:25:48 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28ae1de660bso364869a91.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702553148; x=1703157948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3j8pHX/ha2tS45JBTqWTtF6Y61REl+OUQVKuBmbN9I=;
        b=ZiogNnaXmaSqm9gby1bOXQG9cHexbZH6ixca7irZUhYtSHIKuo5jG/AAiWXHKIUBce
         QIotejgZQnM6kHFY1gvvaCaOJT86FS7WiqA0qMq9KBdZM66KrMz/GZhemYRLIRbv7k88
         RA6ftbhgiA7z705UVtKxoEz4CjxTkrBvTioOO80fNvBkkDVANQK0Qg2U08ddjdC7kqTX
         ASPEMNJLaIg2dyoqPCQ84i+4scEtxyzFHXq7DwHWcCVpfGTiPbzOZrVntZxJiDNX0Kn6
         YW77J/f+d2agcKq69i4BujSC53gAH1QxhG8zyNJdWd48dq/VT6rKOrWH3WJ9hzyjmGbh
         VyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553148; x=1703157948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3j8pHX/ha2tS45JBTqWTtF6Y61REl+OUQVKuBmbN9I=;
        b=gSc7kAgU1IZlvDh3C8QvETWe+tcaHgwoQOHQ2aA3cUa7ugcdlAdQxmr3F81A/Uegza
         r48ghD8JaWQWq2b8Avn3df9YOoQJKbP7+KvJCHg7yrbRvt+bphwuMUe9a4yuefANYMSG
         YskxEeOsDqVk5dTYHiwJkXeMbIu1h7OsvC4o6et7HL1WqW+D7YkUcJyBpl3cKDUAoEzY
         YgSxMB7mCX0b4m54dCIBSkX/5Kepng84p/P9dWtYjKM+LbFrYqTNPZCeffoDUpe6OO01
         3dYGEq6Ltd+180PXtUXqoXwD8QJQ3VyzUKKAwwdbSntQFSR32FYqi+5VjR8PDYMVelcK
         XDag==
X-Gm-Message-State: AOJu0YzrvxS7NwnYJYfCzmOWg8X/YorITXIpSkmFaFSDeJglu8c12hdQ
	Dm+4Py1UQj05LNsqP8rWkpdhz/rB7JUIMn7k0YQ=
X-Google-Smtp-Source: AGHT+IF0ZZGNtgzFHiUlTgoIYQlqAbady2pMj8w32SJC6xp6S8Mrd1m4z0n6aY0Cktu4eRbVeVdg8cmoOwdtkd2bkR4=
X-Received: by 2002:a17:90a:4b46:b0:28a:f1fa:3da1 with SMTP id
 o6-20020a17090a4b4600b0028af1fa3da1mr3257724pjl.3.1702553148249; Thu, 14 Dec
 2023 03:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214112622.2412321-1-xu.yang_2@nxp.com> <20231214112622.2412321-3-xu.yang_2@nxp.com>
In-Reply-To: <20231214112622.2412321-3-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 14 Dec 2023 08:25:36 -0300
Message-ID: <CAOMZO5CRj2yry0Hm6wjueX0PQi+aWXNptqnyu=Ai1CYWVJC0nA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, linux-imx@nxp.com, luca.ceresoli@bootlin.com, 
	jun.li@nxp.com, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 8:20=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> When CONFIG_USB_OTG is not set, mxs_phy_is_otg_host() will always return
> false. This behaviour is wrong. Since phy.last_event will always be set
> for either host or device mode. Therefore, CONFIG_USB_OTG condition
> can be removed.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Fixes tag?

