Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9681B22DD57
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 10:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgGZIlT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 04:41:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgGZIlT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 04:41:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 467CD2074F;
        Sun, 26 Jul 2020 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595752878;
        bh=lYQj8xlMS7eqW4P0HAxm2mnhafnLgSTbAr1pz+13JAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=juEe6ay/2hjA9Nb8h/xoGiF8zKvswKP3JM9gzRNYfysEXyUVgasMVObbkLHJrHKm9
         PHeLaf0Mv3MJag479F93aXrj2jmbkRM+bKqBgrTZMWlun909hJh8DHSN246Z7pN4l+
         kErEouWz5DCei+jUVYtNCZgw20e3pP1dP5SasiOo=
Date:   Sun, 26 Jul 2020 10:41:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Christian Eggers <ceggers@arri.de>
Cc:     Rob Hering <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: Add Microchip USB47xx/USB49xx
 support
Message-ID: <20200726084116.GD448215@kroah.com>
References: <20200723153508.GA413741@bogus>
 <20200723192901.26661-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723192901.26661-1-ceggers@arri.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 09:29:01PM +0200, Christian Eggers wrote:
> Add DT bindings for Microchip USB47xx/USB49xx driver.
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
> > My bot found errors running 'make dt_binding_check' on your patch:
> 
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb49xx.example.dt.yaml: usb4916i@2d: 'ocs-min-width-ms' does not match any of the regexes: 'pinctrl-[0-9]+'
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> The mistake was sitting in front of the computer. I simply overlooked this message.
> 
> Changes in v2:
> - added property description for ocs-min-width-ms
> - fixed property description for oc-delay-ns

Please resend the whole series, not just a single patch, as it makes it
very difficult to pick the "correct" patches to be applied...

thanks,

greg k-h
