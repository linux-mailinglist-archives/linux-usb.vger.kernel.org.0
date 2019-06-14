Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401A64590E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 11:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfFNJn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 05:43:59 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45353 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfFNJn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 05:43:59 -0400
Received: by mail-io1-f67.google.com with SMTP id e3so4270344ioc.12
        for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2019 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXxKAAfwtN7fpBu7AxkzdHVQU2+SVhw77qfjcRwvIlA=;
        b=a7HEKeumOBAxT+4vi3VywZyzXpStPZNrSrzJLFH0k8XNNvUwsgBWHkXlnB6tsuvyHZ
         2xzeGn/lHz8l5B8EL3XCnKj4qrKT5CUmoX0vlZV/7XWkEzBH4Y95HcXfUI2y5Rrj1iPB
         /alDOyFSezF3xLRflMjYpMastx/GUUS0TfH78u5LGsJUmCypQ+Ky0zV0Y2SwNAm9QLMk
         s7Ku3YM7S6dhlbFCybp5QVJfqgfPBoNSAsCF+DXaJyZ3uHhaxDVtgqsDdHEJ8Vxp1vKj
         ju1icJWiASVE2WxM9LMa7LhJnKFgaskPfnAYG8qqAOR38s2bPzbJbdhTnXX2zTlfhvEz
         yz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXxKAAfwtN7fpBu7AxkzdHVQU2+SVhw77qfjcRwvIlA=;
        b=Je3u9T/GlDRmd7R4l1UryR1OwgtNdFrsuv30wtEHCjk3piQFERg7+ltfremjle/AvK
         ca28d1E3+BndPLUkBnnZIxi2KP/AA29+2OdJa0OPtU+Vhor1+1HPfP0K2l/+qetVKnqd
         W7fP56vUwM4uRzLGy/HjeHeKJ+tIUeUUSKRlO8IOC2I0ouPZ+XsxEi2sE+yvayksfUXh
         rhsIMwuePXeBnsVR+y1HN6fPnPcV4PCS/3rY9+rCQHakIKYDgBOn51IwXtXLjW4iXH8c
         H0mUke/Qo4h9SWkf7xoO6CxR/YFhU0ik6IR/BzwJlmTcKo82ZuPMeU3C8aZqEK5wrFIk
         +yGg==
X-Gm-Message-State: APjAAAVRzhSNuzHXN6bzl7mSn21NMCjabWif3lAQ15VgdHPt1GQjiePv
        DjG8ZSJv7qPyxEACpacLNoAQbtYFAX12WooMmSBTG8/EKSo=
X-Google-Smtp-Source: APXvYqx2KIiMFEtGTW8a/lxwGZkBlBNWoPJlhMk8blyI9rVVeZMPQXxRLy4a2WeQEYKTnMMCLAZb8o4NI7pDL3TphRQ=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr53934672ion.65.1560505437760;
 Fri, 14 Jun 2019 02:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190614094250.22997-1-ard.biesheuvel@linaro.org>
In-Reply-To: <20190614094250.22997-1-ard.biesheuvel@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 14 Jun 2019 11:43:44 +0200
Message-ID: <CAKv+Gu8G1638VLJOeyGGtXfBnggAhbQN77wCYyYi-UgikZZUkA@mail.gmail.com>
Subject: Re: [PATCH] wireless: airo: switch to skcipher interface
To:     linux-usb <linux-usb@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 14 Jun 2019 at 11:42, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> The AIRO driver applies a ctr(aes) on a buffer of considerable size
> (2400 bytes), and instead of invoking the crypto API to handle this
> in its entirety, it open codes the counter manipulation and invokes
> the AES block cipher directly.
>
> Let's fix this, by switching to the sync skcipher API instead.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
> NOTE: build tested only, since I don't have the hardware
>


Greg, please disregard - I sent the wrong patch twice by accident (and
cc'ed you the second time)


>  drivers/net/wireless/cisco/airo.c | 57 ++++++++++----------
>  1 file changed, 27 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
> index 3f5a14112c6b..2d29ad10505b 100644
> --- a/drivers/net/wireless/cisco/airo.c
> +++ b/drivers/net/wireless/cisco/airo.c
> @@ -49,6 +49,9 @@
>  #include <linux/kthread.h>
>  #include <linux/freezer.h>
>
> +#include <crypto/aes.h>
> +#include <crypto/skcipher.h>
> +
>  #include <net/cfg80211.h>
>  #include <net/iw_handler.h>
>
> @@ -951,7 +954,7 @@ typedef struct {
>  } mic_statistics;
>
>  typedef struct {
> -       u32 coeff[((EMMH32_MSGLEN_MAX)+3)>>2];
> +       __be32 coeff[((EMMH32_MSGLEN_MAX)+3)>>2];
>         u64 accum;      // accumulated mic, reduced to u32 in final()
>         int position;   // current position (byte offset) in message
>         union {
> @@ -1216,7 +1219,7 @@ struct airo_info {
>         struct iw_spy_data      spy_data;
>         struct iw_public_data   wireless_data;
>         /* MIC stuff */
> -       struct crypto_cipher    *tfm;
> +       struct crypto_sync_skcipher     *tfm;
>         mic_module              mod[2];
>         mic_statistics          micstats;
>         HostRxDesc rxfids[MPI_MAX_FIDS]; // rx/tx/config MPI350 descriptors
> @@ -1291,14 +1294,14 @@ static int flashrestart(struct airo_info *ai,struct net_device *dev);
>  static int RxSeqValid (struct airo_info *ai,miccntx *context,int mcast,u32 micSeq);
>  static void MoveWindow(miccntx *context, u32 micSeq);
>  static void emmh32_setseed(emmh32_context *context, u8 *pkey, int keylen,
> -                          struct crypto_cipher *tfm);
> +                          struct crypto_sync_skcipher *tfm);
>  static void emmh32_init(emmh32_context *context);
>  static void emmh32_update(emmh32_context *context, u8 *pOctets, int len);
>  static void emmh32_final(emmh32_context *context, u8 digest[4]);
>  static int flashpchar(struct airo_info *ai,int byte,int dwelltime);
>
>  static void age_mic_context(miccntx *cur, miccntx *old, u8 *key, int key_len,
> -                           struct crypto_cipher *tfm)
> +                           struct crypto_sync_skcipher *tfm)
>  {
>         /* If the current MIC context is valid and its key is the same as
>          * the MIC register, there's nothing to do.
> @@ -1359,7 +1362,7 @@ static int micsetup(struct airo_info *ai) {
>         int i;
>
>         if (ai->tfm == NULL)
> -               ai->tfm = crypto_alloc_cipher("aes", 0, 0);
> +               ai->tfm = crypto_alloc_sync_skcipher("ctr(aes)", 0, 0);
>
>          if (IS_ERR(ai->tfm)) {
>                  airo_print_err(ai->dev->name, "failed to load transform for AES");
> @@ -1624,37 +1627,31 @@ static void MoveWindow(miccntx *context, u32 micSeq)
>
>  /* mic accumulate */
>  #define MIC_ACCUM(val) \
> -       context->accum += (u64)(val) * context->coeff[coeff_position++];
> -
> -static unsigned char aes_counter[16];
> +       context->accum += (u64)(val) * be32_to_cpu(context->coeff[coeff_position++]);
>
>  /* expand the key to fill the MMH coefficient array */
>  static void emmh32_setseed(emmh32_context *context, u8 *pkey, int keylen,
> -                          struct crypto_cipher *tfm)
> +                          struct crypto_sync_skcipher *tfm)
>  {
>    /* take the keying material, expand if necessary, truncate at 16-bytes */
>    /* run through AES counter mode to generate context->coeff[] */
>
> -       int i,j;
> -       u32 counter;
> -       u8 *cipher, plain[16];
> -
> -       crypto_cipher_setkey(tfm, pkey, 16);
> -       counter = 0;
> -       for (i = 0; i < ARRAY_SIZE(context->coeff); ) {
> -               aes_counter[15] = (u8)(counter >> 0);
> -               aes_counter[14] = (u8)(counter >> 8);
> -               aes_counter[13] = (u8)(counter >> 16);
> -               aes_counter[12] = (u8)(counter >> 24);
> -               counter++;
> -               memcpy (plain, aes_counter, 16);
> -               crypto_cipher_encrypt_one(tfm, plain, plain);
> -               cipher = plain;
> -               for (j = 0; (j < 16) && (i < ARRAY_SIZE(context->coeff)); ) {
> -                       context->coeff[i++] = ntohl(*(__be32 *)&cipher[j]);
> -                       j += 4;
> -               }
> -       }
> +       SYNC_SKCIPHER_REQUEST_ON_STACK(req, tfm);
> +       struct scatterlist dst, src;
> +       u8 iv[AES_BLOCK_SIZE] = {};
> +       int ret;
> +
> +       crypto_sync_skcipher_setkey(tfm, pkey, 16);
> +
> +       sg_init_one(&dst, context->coeff, sizeof(context->coeff));
> +       sg_init_one(&src, page_address(ZERO_PAGE(0)), sizeof(context->coeff));
> +
> +       skcipher_request_set_sync_tfm(req, tfm);
> +       skcipher_request_set_callback(req, 0, NULL, NULL);
> +       skcipher_request_set_crypt(req, &src, &dst, sizeof(context->coeff), iv);
> +
> +       ret = crypto_skcipher_encrypt(req);
> +       WARN_ON_ONCE(ret);
>  }
>
>  /* prepare for calculation of a new mic */
> @@ -2415,7 +2412,7 @@ void stop_airo_card( struct net_device *dev, int freeres )
>                                 ai->shared, ai->shared_dma);
>                 }
>          }
> -       crypto_free_cipher(ai->tfm);
> +       crypto_free_sync_skcipher(ai->tfm);
>         del_airo_dev(ai);
>         free_netdev( dev );
>  }
> --
> 2.20.1
>
