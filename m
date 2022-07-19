Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E5857A121
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jul 2022 16:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbiGSOTC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jul 2022 10:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237815AbiGSOSo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jul 2022 10:18:44 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982CC67142
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 06:54:41 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y8so19708088eda.3
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jW5LCT29GTLVsRW4Q9lBbP1Vv6Oi8d1iNGOWu3XUs8Y=;
        b=kKe/GT//0hV2k4xdzlV4UEeOge+M3omksdHVc9VSeqk4sbB3IurBBpgu5OyNWXs86U
         3c5AKzMFk+K8yqo570hToxAliSQvSvXOJI/Xfq6AqZLlhn3IektXN6gnVJABypRhu2Mn
         HrJbTb40sgWsMHq0rSYdVDadecwbpoEBiYSuHYAA3LK8epmPmOpXDM84UPqX96F3NlWs
         xHsVJzTnFKGKyPI00QlC53zyxTKctU/N5dM8eCV3dMsIoT8och42w+H4l24ixYKg5Ke+
         4CBlPf8mqSth96GKVOE27M32ffr5s9eB2k8OQOILj9eJcWgMoIO9mGWrTCPtIkPvtpn6
         gZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jW5LCT29GTLVsRW4Q9lBbP1Vv6Oi8d1iNGOWu3XUs8Y=;
        b=lDO1fObT/vWGPv7wlfpMrmGxuvW7IEcxgRMS34zX0Pppcb1m9EuyzAtslad3aJLXjL
         hT6wDh94/TyZoayIW3jDhW4LuqJll52mXqhmCoANf9mMVGqajeArFmdc7gF2jkLmkzx8
         JsrK3Ks8nFkqT9WObZ/EOsPI5sc7r624HFw24qatuOvWwwRRj9IdYVj7qFteGPeGB4ws
         pPmypcF7I2ClaHhwqKoZfuyhWIDotEeg/FBM8zQaLHrmfsgToGq4sw7M7wqSyap2BxoT
         uwl+qDOfaFyCc265uR3IA0iHHT/NEiBig8UTVE+OKo7h7UYXF3oVdoPndj2sJRHL6dRD
         AjLQ==
X-Gm-Message-State: AJIora9l6GdGl19GHyDXdtjlbOu7ePy+92fXKSL4JvfWdAnvKDjD3DvR
        htw4JM+RGVSocQ8xPpp0Fjaken0TPWG5fn2B2hM=
X-Google-Smtp-Source: AGRyM1tSJT4qSOWfFBl0QPfnQLKGAKI2rp9bNNyzHoI7YfHHvjagMlTIACGsKm0r/l1utyOwWfzdIza52J0vnLiY24w=
X-Received: by 2002:a05:6402:c92:b0:43a:7177:5be7 with SMTP id
 cm18-20020a0564020c9200b0043a71775be7mr44579358edb.224.1658238880235; Tue, 19
 Jul 2022 06:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:5681:b0:72b:4d8d:d66e with HTTP; Tue, 19 Jul 2022
 06:54:39 -0700 (PDT)
From:   Darryl Jonah <davekosa15@gmail.com>
Date:   Tue, 19 Jul 2022 13:54:39 +0000
Message-ID: <CAC-t08tPtrDW1xPLLBsgBzt8E83uvxrmZ0fAiUyisb1+-2fMFw@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

God eftermiddag,
Jeg venter stadig p=C3=A5 dit svar p=C3=A5 den mail, jeg sendte dig i g=C3=
=A5r
Hr. David Boha
