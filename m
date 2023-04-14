Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDAB6E2776
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 17:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjDNPxI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 11:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjDNPxH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 11:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A451E6A6F
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681487529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ATzwgaslzQU3gPsTLdjNRzR08gZk0kKwHmUAOWcuyho=;
        b=DSmQBifm0KYCV0n2sOqaUnddwTNPIQw0JnIShMyUeMGhX3v52DPC2KALNXIiZAw+3d2Ngi
        2LU+w4RknFbizL061ilNQwFhGYjBNr7nAiMLzxFzhOXikO7wBm5ng5YfamlxJdfI+1+zQA
        Qax39hPkA3M9J+3TpaygE7zDBQfDb2s=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-f4WI4VE3MLmto3QUhBXrRQ-1; Fri, 14 Apr 2023 11:52:04 -0400
X-MC-Unique: f4WI4VE3MLmto3QUhBXrRQ-1
Received: by mail-oi1-f197.google.com with SMTP id j10-20020acab90a000000b0038c3c55cd6aso510179oif.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 08:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487523; x=1684079523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATzwgaslzQU3gPsTLdjNRzR08gZk0kKwHmUAOWcuyho=;
        b=XTdeUvFyOYVn1WNXm5bTlsqPlzW9DyOhP0HtYt83Z4Dq1/H/saCwH3niJQlOS2YZ5i
         Vv37yk/33KVkeDUabetMrxbn0Nio8uEztBPIBgeQ/KbNtUR/bvbobvmUknfVI1V08Kfl
         lpdhd/0LoMGOPJVLpcJdE02O9bgtQjoMn91FqM0/JVMxoRMk3m+AT9y4m9+jCcYHa+uv
         gzwv23w3hJMaD5zseugZa8WwMPG5j2xJQtkHSSVe/3p46Z9kDhotRSGmf1K5IDY55yUp
         eT69iUVueh0G5/M08LDgLTE3C55gv3OWn0XjuRFdI0eS4bkB8vc6+l/ZTys8xzjQGxkg
         nT1w==
X-Gm-Message-State: AAQBX9eX93eUQxuhoTpMcy8Cr4P/8kt8xT7phaSHFSFJqMNRDgMg2jKZ
        8LCBiaV4/juFSmF16d4XvQ1cZYxTq9gzRqV94J/l7gwAwPAyE75f/2e7oJLQEpEkvhe4f/ytQBl
        1U5ADc4Xk2FPjvyvNlJHt
X-Received: by 2002:a54:4601:0:b0:389:4f7b:949d with SMTP id p1-20020a544601000000b003894f7b949dmr2828323oip.22.1681487523000;
        Fri, 14 Apr 2023 08:52:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0ymS28sAALQ4gSVn0pIU6HcawITLnwQRF/nhGAcGXRRC0HAnooY6KqMZffglNozLSmTy3tw==
X-Received: by 2002:a54:4601:0:b0:389:4f7b:949d with SMTP id p1-20020a544601000000b003894f7b949dmr2828314oip.22.1681487522774;
        Fri, 14 Apr 2023 08:52:02 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id bm26-20020a0568081a9a00b0038b734b335csm1800645oib.43.2023.04.14.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:52:02 -0700 (PDT)
Date:   Fri, 14 Apr 2023 10:51:59 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: sa8540-ride: Enable first port
 of tertiary usb controller
Message-ID: <20230414155159.zmhkeoxwhxe5czm5@halaney-x13s>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
 <20230405125759.4201-9-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405125759.4201-9-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 05, 2023 at 06:27:59PM +0530, Krishna Kurapati wrote:
> Enable first port of Quad port Tertiary USB controller for SA8540 Ride.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>

This is nitpicky, but I liked some of the description in the first[0]
version of this patch that I authored for you:

    From dcb27d07f079194ebd7efe1c9bec64da78beb290 Mon Sep 17 00:00:00 2001
    From: Andrew Halaney <ahalaney@redhat.com>
    Date: Thu, 19 Jan 2023 14:53:38 -0600
    Subject: [PATCH] arm64: dts: qcom: sa8540p-ride: Enable usb_2
    Content-type: text/plain

    There is now support for the multiport USB controller this uses
    so enable it.

    The board only has a single port hooked up (despite it being wired up to
    the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
    which by default on boot is selected to mux properly. Grab the gpio
    controlling that and ensure it stays in the right position so USB 2.0
    continues to be routed from the external port to the SoC.

    Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Specifically the bit helping explain what the mux, its default state,
etc are things I find explain some of the hardware/patch better. Personal
opinion of course but I'll highlight it since you dropped it out :)

[0] https://lore.kernel.org/linux-arm-msm/20230119220942.ja5gbo3t3fl63gpy@halaney-x13s/

Either way, thanks for taking the patch along and working on this.

Thanks,
Andrew

