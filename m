Return-Path: <linux-usb+bounces-37747-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPyVB2A+DWrsuwUAu9opvQ
	(envelope-from <linux-usb+bounces-37747-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 06:53:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC9587A42
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 06:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C03683029757
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 04:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F870356740;
	Wed, 20 May 2026 04:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss78Q8On"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4D32B11F
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779252819; cv=none; b=sgQnYaVWYVu7B8fmp0W0X3f5JG9W7hUlaLXFj5AZOIHdS9VrCQzuhd1Q8ITal0FJQbLJLiN2OlkUOu0o5h3kTEMsJuzUZJhxvhBOzqQwSybTaj3fTbnISfkZrKRP04phcWOnokoeF0ShRymsiEqQi5LAUlifE5PEFNbN7cEEjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779252819; c=relaxed/simple;
	bh=A/70exiy/2K0mj3HP4s+WYIp+vMhVWnDct3Z3acCb54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhIB2iI1obGrNWLfkpLH6kgPRYc1zqNyORCJfbLE15Dw/iQTNYBNOyeryZhS6hR8dvu7IjOhSgEJXYR9l9Xf8GVEoS9MBP76UL4sT3PCNC9TTQ10e7npjPw+ONKJvmY0wev5sIO7FA4VDWRxwr2DEc7fe2Iedv29CyCtw03FrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss78Q8On; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-47c7b282e21so1736027b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252817; x=1779857617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg26S8t/TkGRXzhhdHCmgve0tBcd/dsW907d4GgRAv4=;
        b=Ss78Q8OnvijQPwdBH8OmOkhzKmMpYFRgkcX6h7VazKYQaQCacY2FY2eB4fpf5G91QU
         3EZ7hPuvHmEONDSWATaNey3CI+mwEAPLlHafZ3/R3VwzULT9eCEjS0AJKZ2Gc5Vzf0GQ
         Sa0CT4t1fkuj1tC8f7C/eN2Qa/YC7UXAlkBSbcOjWANFqnqkV/CwFTOqpkBD/sulSLJE
         m8BUldMkBt4AqGcl3qP8+6F2oL5/jx42XwWMMCNZEagnJ6oon/sLD0VUj4JLRrraGBvg
         CDSjifZPghdoJlxnwL/lnnmsQ9siGgeD+ONogeNX3dOwayIExUWPTdlDCTxlTX8UOjAf
         nkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252817; x=1779857617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mg26S8t/TkGRXzhhdHCmgve0tBcd/dsW907d4GgRAv4=;
        b=F5+DabPoEGP9hbbw6axK3sn5kGJmK3GgVL5SOyCJ2BKQsFIum7TEb5lPxQyHxaiJZ9
         gwR3c+xx564D6NHITSoTB4GIjnTrGFU2q+jP2LW0Kkh4Z5UYW3QA/suxo0GKtvMtFotC
         Gc4cn1xmWMGpgYTuY6NnticUjQNFGdaVMW2AZOqUwDzEdu83wrrVnbM0D2CL+og6vn7y
         2H3APWJa7rdkjmV5QUi9aKpom7dIcsmnT09IBWGlQBSlw8qpyG02grB6fsfmn0Wp1/xP
         FE7Gwfm13Jzq2Wecgj513Rr3v3KDV6x6WbsSBzVQj3WGom6y5yOzBuJEiV8aw2OtDkqG
         9DDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w6oWo/IwLpsWqpvHM7dojuGCO4S1VjuIpUo1cgL7pgLvAiCUSr6SqBt4/x9fLpX3HnKQVLt0qXv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJXpQK/ftYOIXVozVaqG37kUQ4L9FeEk8EabIiN5blhKvpkDJg
	LglyoHxi/fwdaGC4BWZYv3OkrDYrAHyns5BUAfjWcxZStL84TIu0VgCH
X-Gm-Gg: Acq92OEikmQS34LBtBvJHGE0xn0m+z8ibCWj5sXgsEooYHZR6xOe5SI/eL8T0K3CewR
	8J8cISblHvPWBDsAxLAeyrWl9diZHC4WEST0P5ZSREwQg36dtA59jGCLVwM38LcyRnZsC5/bVY/
	hV59wHcsKOqr2/e4ZDtwiwzscCiZSPDtADgPgLI2899kr8iyv9YjbYOJrW8mr30ADof9WMjbMzc
	Qnac3XaC7voR6eX09cfo0JjKT58QFnx5IhfY8Dc5l8oroUsScgYqm6crcQZwPUuakkm6enDVLY4
	n+LO8BlClakgvu09urmWUwVk7PAxvoYrjpVE4lKQCPkLEEX/DEMe6o9ArojgPjzFw868ZWLiiQs
	2pwIc9V8lVHO5nyaN7sUQz/LLwYuVTf8vNBbS1rpXQw+/b318TPFRiPBUoTGFebnL8VLSmlpjy1
	hW+32P+y2N91GoXnbKf5QY1LSmiYRnM4FhTMoOPKMgv0XoXC0LRQ==
X-Received: by 2002:a05:6808:c1f7:b0:479:dcb1:dce3 with SMTP id 5614622812f47-482e53affd3mr14763463b6e.0.1779252817466;
        Tue, 19 May 2026 21:53:37 -0700 (PDT)
Received: from Dell.attlocal.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee0999f3sm7592870b6e.0.2026.05.19.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:53:36 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gene_chen@richtek.com,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Tue, 19 May 2026 23:53:31 -0500
Message-ID: <20260520045334.159097-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519-quixotic-lobster-of-experience-b894cb@quoll>
References: <20260519-quixotic-lobster-of-experience-b894cb@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,richtek.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37747-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5DFC9587A42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 3:08 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, May 18, 2026 at 11:20:14AM -0500, Akash Sukhavasi wrote:
> > The schema declares 'additionalProperties: false' but omits the
> > top-level 'port' property, which hi3660-hikey960.dts uses to
> > describe the role-switch graph endpoint. This causes dtbs_check
> > to emit:
> >
> >   hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
> >   not match any of the regexes: '^pinctrl-[0-9]+$'
> >
> > Add the missing property using /schemas/graph.yaml#/properties/port,
> > following the pattern used by realtek,rts5411.yaml and other USB
> > controller bindings.
> >
> > Update the example accordingly.
> >
> > Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/richtek,rt1711h.yaml    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > index 7ded36384..05ffc33a2 100644
> > --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > @@ -52,6 +52,13 @@ properties:
> >      description:
> >        Properties for usb c connector.
> >
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      OF graph port describing the connection to the USB role switch
> > +      consumer (e.g., a dwc3 controller with usb-role-switch), used to
> > +      convey type-C data-role changes signaled by the TCPC.
>
> I don't think this is right. There is no such data link for "role
> switch", so this should be part of standard connector ports.
>
> And the only other binding (I found) having these two is
> qcom,pmic-typec, which in practice only uses connector in all of DTS
> files.

Hi Krzysztof,

Makes sense. I'll take a look at hi3660-hikey960.dts itself since it
also has the port@0 required property warning on the same node. Will
send a separate patch.

Dropping patch 2/2 from this series.

Can patch 1/2 (.txt removal) be applied independently with your Reviewed-by?

Thanks,
Akash

