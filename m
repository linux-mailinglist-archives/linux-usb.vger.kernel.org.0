Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5316870AF
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 22:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjBAVsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 16:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBAVs3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 16:48:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA54014E85;
        Wed,  1 Feb 2023 13:48:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E53CB822A5;
        Wed,  1 Feb 2023 21:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738FDC433D2;
        Wed,  1 Feb 2023 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675288096;
        bh=nohq72nSV2jjLhRpAk5UnpL5hktV2vDmaMQZtyMyLso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PgZc9JCFB69COcAUIfdI2TbWdXKtRMSgHcQkUb97miR0FTFvEtDz80vfxp+LE6nYm
         1/y7r5uBJ0lP7tn8tp2ipO57L1+Nx4pDtaZQD3y8TxNaydlddeHaeHI+gyCQ1JSsaz
         HPdL7r6Te9zXG2InIEgGmOHTeqqj0XHke+OdxARVxdibyX1zbYa0GxjiO/bZ3sFq8e
         Do13N6YA5gNa0jIZaknJUokUB9WRXyGxWwEokR8vb+KhUXfulIqzlDphkWQEWvfZoE
         Q4zYEYFkH7E9EUttfNnRck7S+pWw1vNFSTcvhGIbQwk9gwGPY2BxrvOAWPAJD0AA+R
         sZYzbrM18JGMw==
Date:   Wed, 1 Feb 2023 22:48:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Message-ID: <Y9reHZDeRWDRZG7e@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-3-jonathanh@nvidia.com>
 <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com>
 <Y9qZsTQK8G8gW6+h@ninjato>
 <b7576f93-45e5-7d5c-29e1-e95a2e58f118@nvidia.com>
 <DM4PR12MB5770C83B3ED79401558B15E6DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ifa7/+Xth6NipKW0"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5770C83B3ED79401558B15E6DCD19@DM4PR12MB5770.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ifa7/+Xth6NipKW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Adding Ajay.
> Acked-by: Ajay Gupta <ajayg@nvidia.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--ifa7/+Xth6NipKW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPa3hkACgkQFA3kzBSg
KbZmsRAAsq7JPvFWKh2Rvxhs+zXvhAkaS+TH1fPUBOOe27RntRVEEVtB0gLxFGe+
GSjM3853USxGXXRXovWqNbzGzzjvsNgHaYQ3mpONJU2KhyETuiabG+U+PRq+8rQW
Lyz8mMUrx/g/yM2OcWGGxsV2SvuyAnIZrAKLMdWHjzz16el7SJ8M+PJgPOTAIQwl
jkC+3BrAUxknNjh893c2o9bRqI9gs+nMKrTupNt+2itgp8v0Q2jYqGvo91xHAcxM
XvOedjU8k12dGP2eQzXusUahcJ0AfrHh7ZCTZoHo2+30bo0ma9P1EePvM8li2orZ
B3rJmad/v610QLA8lj3feQMlAouvmnqoEGfB8uW8RisEYQu2iuRGt6O1Tco4K1Ct
VJZ8tzxZZeCM1jKnPusHELNTtgKGz9N7YYVQx4FSSSNVwqi03631sD49+m+UrQA1
gr2bY4o48mTBbitOLYDqx8iZr/2PQcE8zpja5R/5Q8IY3aa/tuZ57e8fbTEmosVI
2VBGDnskPxzOgTDkXkJSAXzdYQJqOvwp7IeCmK6KkdGLCW8rmBT4DU0s6bi2+Zxv
xVog/CrH1RwLiQzEUCCh8gIEngx95Z9ouTo5rtWP1oyPWCAZuzzTOflBjxdTfmIr
T+QewxYAMelZKgkcxgLArssgkSas8WKs9DmuVLBfKGEt/x/UOgs=
=EuyP
-----END PGP SIGNATURE-----

--ifa7/+Xth6NipKW0--
