Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C983A5B77C9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbiIMRX0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiIMRXE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 13:23:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D4546601;
        Tue, 13 Sep 2022 09:10:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48D22B80EF7;
        Tue, 13 Sep 2022 15:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455FAC433D6;
        Tue, 13 Sep 2022 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663082053;
        bh=psJfDRHpoMuZdeioB0y5ST0RSTAXOKEZZykJ7BXBqD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WqJjEdvmLxIEnHSzgulW/soDVczfpbdOoMtXBdi+1HgTgM8cExb9GF1Rz0O3tIHym
         ATRnXvnTY9j3Ld4XSaXe47PKtErAxaDHmX++KjTJ+yEj7oNJY2pjBiWr2koO/2m8vo
         cbnp0kPZT3M2m/mvkShtVyu/45Qgn7036csi6/j/9ODYT6e97NIzJnz8PG5+YC62WF
         hhO0i0/2moQ4+uDk7wTpssjlsgzYagfHF85uu12Kys0AYHDUZ6kc0wK5QyZqp1AybH
         EN/qDnv2+bw4nKZ5b/FqYvZ029jfpyBdKhE6Uv4t5E4wD73R7mBMm2iuyS11kRwIzi
         7uT9y3cajd3OA==
Date:   Tue, 13 Sep 2022 20:44:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com
Subject: Re: [PATCH v13 0/3] Add QCOM SNPS PHY overriding params support
Message-ID: <YyCeQUfsVfpI1Z+k@matsya>
References: <1662480933-12326-1-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662480933-12326-1-git-send-email-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06-09-22, 21:45, Krishna Kurapati wrote:
> Added support for overriding tuning parameters in QCOM SNPS PHY
> from device tree. This parameter tuning is required to tune the
> hs signal on dp/dm lines for electrical compliance to be successful.

Applied 1-2 to phy-next, thanks

-- 
~Vinod
