Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9784FF99
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 05:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfFXDBm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 23:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbfFXDBl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 23:01:41 -0400
Received: from dragon (li1322-146.members.linode.com [45.79.223.146])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B4432073F;
        Mon, 24 Jun 2019 03:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561345300;
        bh=P9BHhImn+3omcwGUMLWcmyETGN+Vt6d0VnfIxhxT2OE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lCmci5+xEhz3YBgoCtB2Rgcp2ms+1vfBcgP5VdRLIH9/8EwWWAetmhTUCjWzqAusZ
         92SRzQw7l+lmvHIdpcyt9FHlO9kAsiL2lRN6VXwY/YWtarBuBDsq/S7V6KEw4EfCef
         0ArPVl6ucWEXJl3sl/dHaFI5nTamdAqDA+m1MFZ8=
Date:   Mon, 24 Jun 2019 11:01:27 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, robh+dt@kernel.org, fabio.estevam@nxp.com,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        aisheng.dong@nxp.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        chunfeng.yun@mediatek.com, sergei.shtylyov@cogentembedded.com
Subject: Re: [PATCH v5 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Message-ID: <20190624030111.GP3800@dragon>
References: <20190624020258.21690-1-peter.chen@nxp.com>
 <20190624020258.21690-7-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624020258.21690-7-peter.chen@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 24, 2019 at 10:02:56AM +0800, Peter Chen wrote:
> Add imx7ulp USBOTG1 support.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Applied, thanks.
