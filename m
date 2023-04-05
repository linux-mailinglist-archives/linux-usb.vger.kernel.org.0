Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58946D8243
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 17:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238992AbjDEPmi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 11:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238902AbjDEPmh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 11:42:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B7C7688
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 08:42:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so142180556ede.8
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680709332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3rEjEBIzvTLM76lijFumhUVHcnIxOg2kiFST3j5p5o=;
        b=j0YrqLl8ikrtYvR4+5TGcOG3lc77ztC3YxP5gQBq9siJtXfCwggpjAkRS8aLC9F43d
         rSQfXBM1OZU6sTEseTUVbDj2JJWn1aDs5mYge6bdEXoiCRc/QojFSLK61m2/8oXnJCb+
         5DndmQfMph/b67yqiB8Gkg1xL7KC1E7QGiRdfdHUDugptIJ4RQl1CEfTdGxQGJRMMVqK
         o1e+C/Xv7HkySyEQ8sAu77H2vQwP5ohM8X+SK6xcd9UG+Yc6rbpafDhPmt1hwirNcwth
         kPNsZesw4mHFJDVHDXqCI+o6yg+QmvENnkeFbHVJLwQ/UN4/gp6nsRu07bPJBhhc2/8G
         N4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3rEjEBIzvTLM76lijFumhUVHcnIxOg2kiFST3j5p5o=;
        b=GnZh9x2XDGxUfDLDqWFgVMF8DupuQyDJ6cIVzPZLgsrdl+UBdd4lq0isxE0B2wM30V
         +kL1DlTHAw2VtuPA0ukBvzZ1cWK9W803tl3rVhBC80kCY6ZCuxMi2EY3vML0Nd6kaB4Q
         vBZMBgOudnNN0v+HBQH+ckwJsgxJQ8hMyCBajKM4a67Eg+A3yMN6UhLqyTYSWx+9UNLN
         ErQCQTlYtfzw5WVB1j0qOE1ultM1iOZSPOykTxjvlTnfJNhotfTdXnQcT+ydgzS3WNKY
         5880BEFn5LARAz12FdpeIsyTRUCa1ZyzCLiMe99ZS2lD60TbhLTMOLcnaWM39yxrCfrK
         KwUA==
X-Gm-Message-State: AAQBX9earJ6CAImpDqY2K/x9xRI+zy/VJAI1ZW8qVaPR/dDuXw6Llc/T
        j+eJi4nw9NVQAQvbO3nZqmo=
X-Google-Smtp-Source: AKy350aN36e109j2V5e1/9ZUfUjDj2DnafFLoEuOLo0Bk2QvbJEJs80YfcFS2jjLPSNjlEG5VfvZDQ==
X-Received: by 2002:a17:906:278e:b0:932:e43f:7367 with SMTP id j14-20020a170906278e00b00932e43f7367mr3619210ejc.35.1680709331933;
        Wed, 05 Apr 2023 08:42:11 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id jx10-20020a170906ca4a00b009495cfe446esm1174994ejb.223.2023.04.05.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:42:11 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 08/10] usb: musb: sunxi: Convert to platform remove callback
 returning void
Date:   Wed, 05 Apr 2023 17:42:10 +0200
Message-ID: <2673762.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230405141009.3400693-9-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
 <20230405141009.3400693-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne sreda, 05. april 2023 ob 16:10:07 CEST je Uwe Kleine-K=F6nig napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


