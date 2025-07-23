Return-Path: <linux-usb+bounces-26115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57700B0F261
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 14:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B86DC7B1F9E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 12:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614272E611F;
	Wed, 23 Jul 2025 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q46Jvvlp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217C2E5433
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274140; cv=none; b=O4Nu9bADaTaF5FPNOVg+maKlBH9mZ/5wz8WeSzi4JADr7t3w/+EdTPGXKXAhfiNYlWf1kNwnQLTOzdIcLtcZy+Q3dnoZK2/OePOfjz4qI+/3xGLkgnVXzDNmeKTSi9L+i/p4r31oYzMCmqDPAG1O4PRVYYG/kXFIwch1NahgfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274140; c=relaxed/simple;
	bh=0EFY2t7da13tTNsn0kil1sRIUFA9tzt2B90v+UiI8vw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ESV7J3fCI5fV82lST521HvF6RZumytQg9Ja9UmsKYaRCS6s3xgb9kW0S+Le9aUkAiqcgAoJkcnNhq3itcGY1LkNF7652nDXwi6SnOgU5Czq6N8X2LaHpHQ3rLx4AQvJYibv+JTos2iGRAl3w9Wusdbe1sD7wFhfXYvt8O+2KexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q46Jvvlp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso11469340a12.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753274137; x=1753878937; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+L8u4oiexjWpNgCligb/vTUSVa660rSwO8FUFGgqs0=;
        b=Q46JvvlphqQ3wb249gRqcxWSAE5qFicgBvNrgzFqq8cWqrqvmhLJVqITQf74A/I91K
         001QS+vxKAkNmjGOhTHzBrF+jTsnClICVLkoPQU6jmkp+TDIQIIHdT20Uj2LWFSefGT6
         sV87Tf6ZU36xpQ37iXH7HxmWAnvKFMaFs1Kbrxoy8/VUIs/09PkiVOk9r6vnWBmIez0G
         KY4WCQzWW9cg3Q731ZYzI5aRC3HfYD0sBwdv7aYkCo/m9BnNL6cRVNfUTP01mhqzfY5o
         YsDp2KS8dJd5dK1zzpxpp7oIb4omo+VHvZDHvGGFucHuThdmjqsIIeQfqcyE6EFZ6XAB
         HNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274137; x=1753878937;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+L8u4oiexjWpNgCligb/vTUSVa660rSwO8FUFGgqs0=;
        b=S/nKx7s/EecAbTAeAQ+p+3kpfbbAGlCxWKovkZz7p7hvmJmGhXL8BZ7Q2MIg/qdMwi
         0qVon47JX52YkjSVQm6gbw8I2aormvIvRJvJ/QRf/KXIPwlT6B/3TJqBcgVHWxBmUYa+
         QhvcMPdVvny4BPb05+rrZje7/0bj2ErrAVN9uiUYuPT4V4y2XZWuE5MdYU6lmeRfjG9s
         26SWZH7yUCogpfz13K45sIBWF9EZaFJioRNPo0Gy2VdTkNuOg5CT57xBf5lbOM3bKtqw
         pcSwwEYmpSg/jvU9wMOXEU01XKeDM/LFSu4PcGL1KY7mGquJh1H0mlmIbY97np1dcWGS
         /7ww==
X-Forwarded-Encrypted: i=1; AJvYcCVbn1EDKz7zOshsIWjkgbZLMvOSDTxrNwfGvef4RtPBBMCEWMf4+PHMytQW9WkyrJZq9LCExS042D0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoN5fTmzlwxAQ+u0/NgLZfGu0ReOZIA2kyyEY3JyYvUC3fZoy
	mIAQjKkDzMHWMpF8k4DbTol0SqOmry5UxzrrE9K2FSXpr4L9qNZF6dI8oG8y/qQCBuU=
X-Gm-Gg: ASbGncs27WvpOg27Etu58Tk8ECD66AbfMRB3Kt5or82rl0PyElPObmdfWX7xY8CZfz4
	Dac7dd1SjVJk87nZxqHLQxdaCwuaemjByOqJDgwzs0owEa5ICNUjVsw6tp0A6ESVIoxAB4zuN4t
	qVhib+ohvPZC7iUa9wrKyHy50y1RtCNiVw67lgf6CvwBChj6UpCs8NlgC3u2U7Z8o9LOpzuUxpx
	Gb47GOTag1rfaafYARiqhx1qNPosugP7shcy3h4g6Zb8jJB/ODQOV9whQS3Y1vVYNMc+bazWsbV
	SbwukGyQAbgCurRyBGypueZXr7ppJAoQPFbjq+v0ApzKtjyNQ8/uXj+C2mzSXCDk+uiApm/erNk
	1GHErmEOWsqgiqDeeQI5SUSbhx1ql0b0+znEfMhZmdw0cOCAM5IafprVC5wwp5MSiYIw=
X-Google-Smtp-Source: AGHT+IHiFY0lG9mRPneADgyis/AcrbOpYfn7ovZrGfkcXUWNCou+f8RDQqROv1F9QSh2mViYt+ozOQ==
X-Received: by 2002:a17:906:9fc6:b0:ae3:4f99:a5aa with SMTP id a640c23a62f3a-af2f64bcdf5mr272122666b.4.1753274137382;
        Wed, 23 Jul 2025 05:35:37 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca817b7sm1038885766b.135.2025.07.23.05.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 14:35:36 +0200
Message-Id: <DBJFT72B59MC.RIRP9YSHOX98@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Felipe Balbi" <balbi@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
 <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
 <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>
 <DBJDZBYHR94V.1QGVALCL60M1X@fairphone.com>
 <00c2ac7c-763f-467f-8199-76de9f5d71b0@sirena.org.uk>
In-Reply-To: <00c2ac7c-763f-467f-8199-76de9f5d71b0@sirena.org.uk>

On Wed Jul 23, 2025 at 2:19 PM CEST, Mark Brown wrote:
> On Wed, Jul 23, 2025 at 01:09:35PM +0200, Luca Weiss wrote:
>> On Wed Jul 23, 2025 at 12:57 PM CEST, Mark Brown wrote:
>
>> > As previously discussed they won't apply until after the merge window.
>
>> Sorry about that, I thought the conflict was for the 6.16 merge window,
>> not 6.17?
>
> There is a conflict.  You could check this yourself...

I see now where the conflict is, due to an updated previous patch.

I will send a v3 shortly with that resolved. Then it applies on your
for-next branch cleanly.

Regards
Luca

