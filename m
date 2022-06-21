Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106AE552CAE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 10:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348091AbiFUIRT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 04:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347889AbiFUIRS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 04:17:18 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A313C24BE5
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:17:17 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id i15so18315987ybp.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z1XC4FGJDv1YCGxIMd5GFq6JBcEZ0/Wkeq7WbSc1acQ=;
        b=MSXeQOCpeduuwaD5r/shpkRPdYp7ELRJ0ziYVhnk3IIVPMjPzCKNP6iGfJBlkAGmlc
         wejHcT7SC6r4YEelP1coA2rCUit8dJ4MQKoJhP3109gKhhQ52It37alwTD6tJWKkQ3sA
         TKP/Tw3s2TfRF8rtPSWlmhoWyLVWSmR0M21L2wpOfAnk+5HB60m436J/Yvl1rWiwC5yl
         qp1M4aCV61fJe5dRvK92hfE/TktF/OmGNFtKiJjBID/y9m5LOAHddvpeoH6CZJg369uT
         +ACUo3OoqlwYfVPc2Zzg9Ii6Unq4aHbIIvkvOeaSoFkIpQ7vCzO9nIN7UlKo6qqEDcXb
         PEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z1XC4FGJDv1YCGxIMd5GFq6JBcEZ0/Wkeq7WbSc1acQ=;
        b=kZro5nt/AVbgJjF9VcmXJHmiw7evoVoVEcRN95kW/RgZ2IeuYcIoE1rU5lM5dcZJQa
         mdC660nBAwJQgFN4Ot4kn0yYM5EdW8cCl/4QeElD6OK/jF6bdNhFlPfGXDiDp8kifQw9
         iEMUBXkPTYjHbTyC/EHX+CX/6SbU+ZtVLWPaS/XVD2kxwp0MnB6YVdmH1xlCBbbMcetO
         P8iR0ZlZBpIDMQvOgWeXScaZ7uHRYyrCqZkio/FdyGTEAGCy8vkpMDJnXZvCCkZAKENU
         LxfnQaTe6g0dTd60xwn8vRYNPlM6qqGGsD7g1DARrsY/0/fUG8i7wI0l5k1CuGiHWk35
         dgLw==
X-Gm-Message-State: AJIora9bSYKSoWhdA4WlskXORgxIP8ontHTbcL/aSjafQrG9drS/5Jb0
        JcbCW/YVG7JmmzEUlniPYlUZpHRRlj9O5mTaAjrYQivguPM=
X-Google-Smtp-Source: AGRyM1tBHk5V67hE9OHDRqnZtpEad0OunQeFav3rNrsRHkk76NwfUroxXzOHakha1LRkXxCjP929jVG/bp3iWJhs/0g=
X-Received: by 2002:a25:d24f:0:b0:669:1646:b07 with SMTP id
 j76-20020a25d24f000000b0066916460b07mr9943149ybg.553.1655799436830; Tue, 21
 Jun 2022 01:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220617133514.357-1-charlesyeh522@gmail.com> <YrBARs5dfARHW9Rl@hovoldconsulting.com>
 <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com>
 <YrBq3+Q4geN0bF5x@hovoldconsulting.com> <CAAZvQQ4xy+YSuEipRX=bLXJVKtS2qExOBER3QH3BJw_ATYdXuw@mail.gmail.com>
 <YrF77b9DdeumUAee@hovoldconsulting.com>
In-Reply-To: <YrF77b9DdeumUAee@hovoldconsulting.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 21 Jun 2022 16:17:05 +0800
Message-ID: <CAAZvQQ656Q=FguDjpcpsDb=26tKfynpC7KGZ=MPZp7SpW=DSbA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> I'll prepare a patch that adds support for the missing HXN types.

OK. Thanks for your kindly help.

Charles.
