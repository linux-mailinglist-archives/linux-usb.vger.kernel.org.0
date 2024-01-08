Return-Path: <linux-usb+bounces-4856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4D82783B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 20:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB741283C49
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 19:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C673F54F9B;
	Mon,  8 Jan 2024 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KccVwIMV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC965576C
	for <linux-usb@vger.kernel.org>; Mon,  8 Jan 2024 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-557a615108eso2307a12.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Jan 2024 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704741224; x=1705346024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oXQEvZyRm83EC0SdphMRj69tozvt9DFLasvJhLf/LE=;
        b=KccVwIMVrYMTbAd5xZYhE4O3dGD63qx+gbJodl3V2UFPJ2j360qi+l+uhuxP6UTQ3N
         5oeUDc0ioui0Kxio+fUtFhvg3Yf50B3burL/QshR01HEclBM2/aPFNCexSYLrV4gAKYa
         HssAnQ9cP0Q7VeGFJlc4FyD8G3TR29l7NHX5k2sbr1ONWroubiymSCMPhDSZTxhllXmv
         KDiLMCuameKwYFSd2b9tebKLGywjymFS3MuiMiJR7QMDFGSvqhT9mM1YvoIrqKHJQput
         L+c974SjSYOFkAKZ1RLKE8+lN67jdrrApw4bmUFHEprnbN7jZuljDWOL57G5hgKcl/3E
         LBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704741224; x=1705346024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oXQEvZyRm83EC0SdphMRj69tozvt9DFLasvJhLf/LE=;
        b=v31yq7JVrERXM3QJlkCXlLuvvXabSDg+AHQXF7HG1qU8Rqp5QV7iBOYIE5QUo1EzmF
         CpN6hEQWBIOlSDhZ22CIce4cQMUGYKhxPmZAPtuyf3QqgZ0wgOrMMk7MRAjAuYv9q31v
         1TmoD5EAEe9IOnOWZkcISj0CtafsmutBTzWsyrbmZm0BYbv2bhUohaSem/IOjw/JiRVY
         IgctTgGj1z6Mzn8vttWKOOWqh8PYgiiVscL+YgCVa7bznLQj2so0FgV0pFoxDHVR3Sws
         N3MYsdy+z8gd9lu20xaIv2a+x9ck0v6YYIi8C5r3Cq6XcB3VU82Hn/sL4AAVOkEO8Y7T
         llYA==
X-Gm-Message-State: AOJu0Yxgw/0Pe9q+E1zLeVSTJahyMr9J6X43+f1Ppo7wLDkomrbs5ru8
	oz3wG3/4cAqvC8G9nT2rhnAOzOKQEHnYlL2v45nbF7Sd3xcW
X-Google-Smtp-Source: AGHT+IEe9b/BGjK21pYspxexkEyrcJXFEnlR6e3ULTttrVUkeJbZTST3UeFapBlY232i4XBG+5+qtthjbxcHcjBCSq8=
X-Received: by 2002:a50:cc87:0:b0:557:15d:b784 with SMTP id
 q7-20020a50cc87000000b00557015db784mr1775edi.2.1704741223938; Mon, 08 Jan
 2024 11:13:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214230850.379863-14-rdbabiera@google.com>
 <20231214230850.379863-19-rdbabiera@google.com> <ZYGjmryUR7m2Q9yw@kuha.fi.intel.com>
In-Reply-To: <ZYGjmryUR7m2Q9yw@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 8 Jan 2024 11:13:32 -0800
Message-ID: <CALzBnUH6Zb+yx-ri39bPOoTydNcQZOc3Vwo32xLxtS_dESBWGQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] usb: typec: tcpm: process receive and
 transmission of sop' messages
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, badhri@google.com, 
	bryan.odonoghue@linaro.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 6:07=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> Why not just fall through?
>
>         case TCPC_TX_SOP:
>         default:
>                 negotiated_rev =3D port->negotiated_rev;
>                 break;
>

Will do, thanks for the advice!

best,
rd

