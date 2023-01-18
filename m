Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7F96724C0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 18:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjARRWa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 12:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjARRWU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 12:22:20 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795834B48A
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 09:22:12 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id u8so17338903ilq.13
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHkgikre77EHT3/g6r0NFQCicXfNDncfTKLPLwU0O5Q=;
        b=mQVPzVOy2HAK3snoqJ5SuOs+TGigKX0JzcM1I1ffephUlCut6a4watbrK58DAtqW+O
         P2HRiFijPyWn9GdB6MvCLt9VxuyXmA/G1XQkqssjC+2RJwT2f8A6EGONwN81bkZx5bmp
         +zQylD+L4yXp6WDODprc2dRr9Q2DFYgySgNMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHkgikre77EHT3/g6r0NFQCicXfNDncfTKLPLwU0O5Q=;
        b=zsIwEtfXdMCWTGV/R1PLs6whbSKxS/MFyXO32eLmw5vBpvctHnG+im9KDqmV59WGor
         1lSvIMp++RoRl9PEfsPAz7rSucPUV96uWH6Mz0DIXF2ijDTWF4xUfTU76IsWwLGRk6R5
         egDI/RXEWLR8VJOEBqrHlJBotPG+gMvXxqD3PPxYMvuqFadZq0y4/Tzn5fEGNXfi2mZu
         R3FTJQrkcOBw75MTqVD+57XohMvzo+fYr+Km0zLegRbrTh4bSyFQqrXh8bAdyffTKw24
         IIsZGr1hhdv/UhTPpSDkJAxupTfSiMNoXAIBQ98sQncrpdjR8nYNxRZbcyQMcxss1+/I
         uKqw==
X-Gm-Message-State: AFqh2krXRFwPNIZVwq+6GkMEvmFZiAF4/QNPjd8y1sB9a/6HfTwsznMP
        nTSHf4OYw77vpoMiJhPvV9UObQ==
X-Google-Smtp-Source: AMrXdXtMjhW5fHNPeVRbpUj2TtE21JZN3FT5gzC4TId5LfCuRZEk9efrLRfrVPrpMeR7hh+KOEpAZQ==
X-Received: by 2002:a05:6e02:1d86:b0:30d:c671:48c5 with SMTP id h6-20020a056e021d8600b0030dc67148c5mr8273983ila.16.1674062531845;
        Wed, 18 Jan 2023 09:22:11 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id z1-20020a027a41000000b003760a908bfasm10644139jad.169.2023.01.18.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:22:11 -0800 (PST)
Date:   Wed, 18 Jan 2023 17:22:11 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-amlogic@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] usb: misc: onboard_usb_hub: add VIA LAB VL817 hub
 support
Message-ID: <Y8gqw3G0z25zG69K@google.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-9-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230118044418.875-9-linux.amoon@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 18, 2023 at 04:44:16AM +0000, Anand Moon wrote:
> VIA LAB VL817 is a 4-port USB 3.1 hub and USB 2.0 root hub
> that has a reset pin to toggle and a 5.0V core supply exported
> though an integrated LDO is available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and
> the core power supply.
> 
> Add USB device id's for USB 2.0 and USB 3.0 root hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
