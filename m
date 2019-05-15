Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD5F1E9C8
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 10:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEOIGI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 04:06:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57752 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOIGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 04:06:07 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 69C6A25AF19;
        Wed, 15 May 2019 18:06:05 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 4C5AAE21335; Wed, 15 May 2019 10:06:03 +0200 (CEST)
Date:   Wed, 15 May 2019 10:06:03 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Message-ID: <20190515080602.li4toqqcqzwfebbk@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-12-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-12-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 14, 2019 at 09:56:01AM -0500, Chris Brandt wrote:
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

