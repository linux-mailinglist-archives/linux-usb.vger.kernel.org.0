Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B2A4F065F
	for <lists+linux-usb@lfdr.de>; Sat,  2 Apr 2022 23:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiDBVOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Apr 2022 17:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiDBVOo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Apr 2022 17:14:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85A4BF2
        for <linux-usb@vger.kernel.org>; Sat,  2 Apr 2022 14:12:51 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id c15so8235251ljr.9
        for <linux-usb@vger.kernel.org>; Sat, 02 Apr 2022 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/CsZAmpO0XrU711+MySx4TZ4692BiQKBX5G9tt8o2yQ=;
        b=KSpCN5ImfnG9LJ1RmzLizAlndzuVcJwMUf1HHMH+waJuCQ74DYunKp+Idq3f1Ds6kz
         jTAVy/E5VSQHWH4i5wk8SNh+koANAOjePjxbCF2BnNGF+xj7AM3bLQrUKzZTXSEAFak8
         dszP5gUcJOBxRP196jyt9j8DwPu5/OIL9J4Vspiz81oBPMJvGttqFpLOZhWDbGqPcr+P
         agXqkfVsJK0QnXdWI+vQpYyRtDkV7prC0exIroNy9yTnekr5ulkof6VvaiVdW+wJ5YcX
         xj1ZwNCILwnLWa8eQCLVE1RsPc6LgozQmkcAReUGB/oxQfR7H6MAeEbkOjTYpTP4WIKd
         LrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=/CsZAmpO0XrU711+MySx4TZ4692BiQKBX5G9tt8o2yQ=;
        b=5Cv8ADAEvNxJH3OgMRcRs+epm6tLR3wWOsYOGGnSkxtxZR0eBzCXRVv5q8k1vooCVL
         OhdOChKAAQYj2Pk8iHHgD8X2K8rZuPAhUsiYv6hjwy95ooSIiS7zD9T6ojiIeqUv0vMb
         uoQJ5BzVGPrepuM/zAgaAzuupuJGeaJIt2ecUwE6uT4OgDW5+LKcqEvSqMzSwO+T5uAz
         FPivz1Ml0YLkhxS/EQ2YliHG4KRF0yb/vuQqOs5Jmcq0RIYHJczJItct3LO6osqG88pt
         bPjzdR+9Ex4FrgZ3xxS0FeULtK6wmocpD4w8hY0OeQ8GB9Q1xLQlhch41Lmu6G/7kuMk
         vpeQ==
X-Gm-Message-State: AOAM533oanxC3jsKaZKAcCwtPb/3dygSd88tjvy1WE7e2aDnLteRIUVM
        NJw931cDqBieBxpk2lTt0YzEd81H0c4=
X-Google-Smtp-Source: ABdhPJyxroFiNdB2xFV2OJYNHyVAUFOqpflLPGbLz+sIbRs3wsW9MkT3ozOYZ06knQaruP8Z649BcA==
X-Received: by 2002:a2e:a905:0:b0:24a:fed2:d12e with SMTP id j5-20020a2ea905000000b0024afed2d12emr7289683ljq.255.1648933969760;
        Sat, 02 Apr 2022 14:12:49 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.79.7])
        by smtp.gmail.com with ESMTPSA id v10-20020a2ea44a000000b002493831631csm598839ljn.14.2022.04.02.14.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 14:12:49 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Buffer overflow in drivers/usb/host/ehci-sched.c?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Message-ID: <2f9e5b99-c527-9c54-7fd3-0f052be982dc@gmail.com>
Date:   Sun, 3 Apr 2022 00:12:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

   The following function in the EHCI scheduling code causes the SVACE static analyzer to
report possible buffer overflow (see the last assignment below), e.g.:

Buffer 'ehci->bandwidth' of size 64 accessed at ehci-sched.c:240 can overflow, since its
index 'i + j' can have value 66 that is out of range, as indicated by preceding conditional
expression at ehci-sched.c:240.

   I tried hard to analyze this code but couldn't quite figure out whether an overflow could
actually happen... Maybe Alan (or Greg?) could please help me out?

static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
		struct ehci_qh *qh, int sign)
{
	unsigned		start_uf;
	unsigned		i, j, m;
	int			usecs = qh->ps.usecs;
	int			c_usecs = qh->ps.c_usecs;
	int			tt_usecs = qh->ps.tt_usecs;
	struct ehci_tt		*tt;

	if (qh->ps.phase == NO_FRAME)	/* Bandwidth wasn't reserved */
		return;
	start_uf = qh->ps.bw_phase << 3;

	bandwidth_dbg(ehci, sign, "intr", &qh->ps);

	if (sign < 0) {		/* Release bandwidth */
		usecs = -usecs;
		c_usecs = -c_usecs;
		tt_usecs = -tt_usecs;
	}

	/* Entire transaction (high speed) or start-split (full/low speed) */
	for (i = start_uf + qh->ps.phase_uf; i < EHCI_BANDWIDTH_SIZE;
			i += qh->ps.bw_uperiod)
		ehci->bandwidth[i] += usecs;

	/* Complete-split (full/low speed) */
	if (qh->ps.c_usecs) {
		/* NOTE: adjustments needed for FSTN */
		for (i = start_uf; i < EHCI_BANDWIDTH_SIZE;
				i += qh->ps.bw_uperiod) {
			for ((j = 2, m = 1 << (j+8)); j < 8; (++j, m <<= 1)) {
				if (qh->ps.cs_mask & m)
					ehci->bandwidth[i+j] += c_usecs;
			}
		}
	}
[...]

   There shouldn't be a buffer overflow iff qh->ps.bw_uperiod is a multiple of 8, right?

MBR, Sergey
