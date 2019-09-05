Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069C4AA87F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 18:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbfIEQSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 12:18:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43302 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387948AbfIEQSJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 12:18:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id d15so2060800pfo.10
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
        b=DhtZCS6pEqVXAANTeuPn229D+BZX3X67QaHqNgnEKoio/f3XFGIKudVgM5FDU+7o8L
         nQ6C8zCJpGUG562Tdrhhk+jzdjUxPEUMlyMrosXluqm8s7BPYWWQ2Sfl8GPdcyN3+vz3
         WgC0nx5vQPM/ac0gkVSlnhW9uet9jY41HdO0XoqnQ4dQQgwZRDvRXdAX5pdKiXWoz78p
         gJ/gB20nx7nFBvvCBuWrSZgl46CenVN2LnP6ZluOUqhvk/2lQx7TA+V1EqPfUJ0tOjn4
         d9umZlIflwKbjOrolidHP4+2mwXkt5JzsO/HIsQg2gt2s/+L0G/cpcGqNlGMyilyzdUy
         uaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
        b=ptFsWS/rgDXzPmizgXB77sy7EZKYzT//0NST7sreApfAUaGkgLvgR/C7h/u4XiqIHF
         G3ACctiP6K44fngSbBzNdOHihG6MO09u34izBk7X7r4mCIqysr+CQqFlb/NtIpREbfDr
         1WmFbqkqURR7RcYxuQ/Y6YbYvYHGsrxz/aWSpcFvALqZuhtldg93r1nY6pP8lvekr0g6
         1gsKHWQ+Y6V6S4Il/vXYwQqi+yG6lMi/i9eVDYwKEkQ9KDIVyjhU8oygDkwTVM+vRrLh
         deebKSXsVdCNs3H9giPYjffeY99+mysyUnZzT5pwOVGx+ZVFhX5PedH0uvaLNhlQslpw
         HYTg==
X-Gm-Message-State: APjAAAWzkauorjiHPFiiGJLHFst361rYtwrxPmfA8t8E7UGBpu8o95Vv
        e0ZShEkQj26z4MLKMBkM0LJCLA==
X-Google-Smtp-Source: APXvYqwjC/u78z/zaGM+j2+m/kS1EooYMEgWtfeDDH4gvURdMNHJyy5MyPkUpGOGmsnrWffGg8MToQ==
X-Received: by 2002:a63:394:: with SMTP id 142mr3929328pgd.43.1567700288547;
        Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 06/18] ASoC: tlv320aic31xx: Handle inverted BCLK in non-DSP modes
Date:   Thu,  5 Sep 2019 10:17:47 -0600
Message-Id: <20190905161759.28036-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

commit dcb407b257af06fa58b0544ec01ec9e0d3927e02 upstream

Currently BCLK inverting is only handled when the DAI format is
DSP, but the BCLK may be inverted in any supported mode. Without
this using this CODEC in any other mode than DSP with the BCLK
inverted leads to bad sampling timing and very poor audio quality.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 54a87a905eb6..d3bd0bf15ddb 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -924,6 +924,18 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
+	/* signal polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		iface_reg2 |= AIC31XX_BCLKINV_MASK;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid DAI clock signal polarity\n");
+		return -EINVAL;
+	}
+
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -931,16 +943,12 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	case SND_SOC_DAIFMT_DSP_A:
 		dsp_a_val = 0x1;
 	case SND_SOC_DAIFMT_DSP_B:
-		/* NOTE: BCLKINV bit value 1 equas NB and 0 equals IB */
-		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-		case SND_SOC_DAIFMT_NB_NF:
-			iface_reg2 |= AIC31XX_BCLKINV_MASK;
-			break;
-		case SND_SOC_DAIFMT_IB_NF:
-			break;
-		default:
-			return -EINVAL;
-		}
+		/*
+		 * NOTE: This CODEC samples on the falling edge of BCLK in
+		 * DSP mode, this is inverted compared to what most DAIs
+		 * expect, so we invert for this mode
+		 */
+		iface_reg2 ^= AIC31XX_BCLKINV_MASK;
 		iface_reg1 |= (AIC31XX_DSP_MODE <<
 			       AIC31XX_IFACE1_DATATYPE_SHIFT);
 		break;
-- 
2.17.1

