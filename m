Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65BC410953
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 04:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbhISChz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 22:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbhISChx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Sep 2021 22:37:53 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9CAC061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 19:36:28 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so7445703otj.2
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 19:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=NdfOI4pLAZV9M1l1OIkcn0omvnM6YyDLp+ahHmCFaKQ=;
        b=lXUYrYUIc9+i6GfkUq72SagZp3OtoOqFJlM7+P5UWk5ZhvZx10PbYn5EcoAtI6QbUJ
         qTeQyNRdLsHz//W4xzAsy5u9c+WpIjqLIL9qy4hV0hgRzkmyMTVIyUt3H4l/ZX6Dy1vw
         cli+KZfuOeXCSSjaXB2anWmeUkoL0LiHHrvHdRa8Kdg8s0tw0it7dWyEnZ/2Yl5Efnhq
         VaNs2xX6MsuDshTHYCz1bQwnqtgiBGbck2RvSWUXltpEMqovZo7FAX2NXzID2ZMCC4A5
         8C2TMMInXHe87FO0ECL9q9mk59AX1fxiXG758/FO5nSH5kHG2OmXOV2ssGvArxXCuKdw
         RSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=NdfOI4pLAZV9M1l1OIkcn0omvnM6YyDLp+ahHmCFaKQ=;
        b=J0AbP4ZVYu/eoz0vIzciXLwRvUnsvYQhZBhYZldKZ2OsDg30XoBgeKAuATveabfYcc
         ZitLZ0m8JmdbTNd4c2GMgpM2UERHgEvLMwk9L/YqYM+VlodyPH2Eqvdg5FVHRv8SG2DB
         SIVSaiZnPVOSKrYwMwG0mqb4IsXhheGN+hXMydstBUd99EKEe382P8EPhg/TtSOpYzsB
         5k0NjqZVic1qM6KKYAA/yFGGgEFztO/UyvFR42UTnBAg11W3aVRn5FAIE7vCdlSCcwvg
         C2OmcCBh/b08CRgf5kOTyvFqJSkOboefBdGBQnnE6k0RLdnLeRviEa1y4uOFVADvhf4+
         5A7A==
X-Gm-Message-State: AOAM530gsN9xLYWS2gYQI2uNg+mMhqOFDT9i0QPTjXKc2a1YV1vBB7oR
        lIEYnb6WXnYnSRBIBPrFPxV9fdbPq3njlOM2o+Q=
X-Google-Smtp-Source: ABdhPJwwiYv+CXA4X45EYpyHDDAUEEVv95kFkD4rZdeZfh/IYpaqv36NzPGNxQW80crfur5IdEDY5g7jqgKIzpavpCk=
X-Received: by 2002:a05:6830:4389:: with SMTP id s9mr15803761otv.138.1632018988366;
 Sat, 18 Sep 2021 19:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:1a43:0:0:0:0:0 with HTTP; Sat, 18 Sep 2021 19:36:28
 -0700 (PDT)
Reply-To: ahilhim@yandex.com
From:   Aahil Madrigal <owenfled@gmail.com>
Date:   Sat, 18 Sep 2021 19:36:28 -0700
Message-ID: <CAFqHHdqJfn8Vo6Z7O42WT-GRXZ2QhKED3JJUH0Mx_L=uPHLM8g@mail.gmail.com>
Subject: Von Aahil Madrigal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
Bitte entschuldigen Sie, dass ich nicht Ihre Erlaubnis eingeholt habe,
bevor Sie diese Mail an Sie senden. Ich bin Aahil Madrigal, wie geht
es dir bitte, es gibt ein sehr wichtiges Thema, das ich sehr dringend
mit dir teilen m=C3=B6chte
Dankesch=C3=B6n.
