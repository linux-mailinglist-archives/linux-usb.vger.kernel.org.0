Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC1070FCE3
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 19:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjEXRmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 13:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbjEXRml (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 13:42:41 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12226E61
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 10:42:30 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6238b15d298so293346d6.0
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=V+icCz8Wkib87kWDCS02h4LhRjsobBVVm1jhD52MjTvZmMBlrKW78D/7dLXkzzi12q
         6XXNonAITz3cc8q0J+zQ1M+Qste3MQhp/Bv7b324jyGSWhLTHIvgo/IozK/brYE4+mhO
         XQVs4A8fNuBbryXY4ncKCfTMncEVlMS2ozRaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=RTIL8f0KjJS5n04sqZFXNqf7OErH/iIHrpMaA5oUTEzyQggIuw8dsDRWRWbfLV2Wor
         CmF0QxcvD6jf5rrpGo8/H66nl8k/MUgPbi+xKdwTqtQMsFnH3v/tqIPD9B4VLJirhshM
         sd3JVie0dZdUbHi6hNsOzS1D8KGAw08ajOpHAe5SmJBWnqL0QPyvu10erGcOPDulw0Q2
         QS3AN3W4GnCOoy6EmNYSw4zTO81ph2RFbSYhSrCig6s9Y7Aqui6IqqO3hstDGUeVcmh+
         QjDoktHEX6t3xe+OLrKzAbslfvTJhnbYMp9crBo1HQFBt6wIyt7llnld5pRRSyPfqkfG
         qQ/g==
X-Gm-Message-State: AC+VfDylDakKwaefU5/SyhTKzX/od7ZFHWcQv6agthwNHLhvOf9jOYTh
        6uEdGL7i7djDeGP8euDacmf+yza4s9swWx+FEcHQHw==
X-Google-Smtp-Source: ACHHUZ7VuoEl/eBzhNV09bqyw11BoMXJFgg/WXWeo6+8EEukNTKi78vrfyLQnNkdab7TTr1fcrkG9J5e3zT0+Gm80uo=
X-Received: by 2002:a05:6214:c6c:b0:623:8494:9946 with SMTP id
 t12-20020a0562140c6c00b0062384949946mr26307431qvj.45.1684950149123; Wed, 24
 May 2023 10:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230524122901.53659-1-heikki.krogerus@linux.intel.com> <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 24 May 2023 10:42:18 -0700
Message-ID: <CACeCKaendr7Z8xE44uQw-QZ66wMdV-jd8SQ+ZPUeOdVpkq8ZHw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: Remove alt mode parameters from
 the API
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Wed, May 24, 2023 at 5:29=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The alt mode descriptor parameters are not used anymore.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>

For cros-ec-typec:
Acked-by: Prashant Malani <pmalani@chromium.org>

Thanks,

-Prashant
