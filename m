Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562913183D6
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 04:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhBKDHC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 22:07:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:57934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhBKDG6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 22:06:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ACF764E30;
        Thu, 11 Feb 2021 03:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613012778;
        bh=vfhY2X8JAN3tDEQxI/FbOg6eg3DdA03WQvJhn6ih+FA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RH+nVGrD+ELKeOg0I9uGsxmVOHfpKz+aDTCUR4bTCADRmZqA2fIbtaZEzIUmvFQv4
         /jWifxYOKAHU/cJ84yEFolgAZ+pP2GnzUnogDsCqLUlqcG0Pp0UiabH1WOpE6D3EmZ
         8cCOonbUXNCbAZUF0ijRdt+kxeq+vRMsuZwAHmUBfS27O2eYraSq9AQXAMhInjwwCz
         GQ5aA6MQn8yN1Lh4wHZKePfOPASlos3V8mxqWO35h0zBD83r65w+BQzMcixfQS5l6Q
         gFQ9O+sZdDoYQ3z4U+YC+2WakjrZO7iXc5pkhWaDVwoLS+JCdM7wYB7iCF4lkZJ3i7
         LnMllC35brXWg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210119085546.725005-3-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com> <20210119085546.725005-3-jckuo@nvidia.com>
Subject: Re: [PATCH v6 02/15] clk: tegra: Don't enable PLLE HW sequencer at init
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, kishon@ti.com, robh@kernel.org,
        thierry.reding@gmail.com
Date:   Wed, 10 Feb 2021 19:06:17 -0800
Message-ID: <161301277703.1254594.963977431178461704@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting JC Kuo (2021-01-19 00:55:33)
> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
> power sequencers' output to enable/disable PLLE. PLLE hardware power
> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
> are enabled.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
